use glob::glob;
use std::env;
use std::fs;
use std::path;

fn copy_snippet(snippet_path: path::PathBuf) {
    let mut new_path_parts: Vec<String> = Vec::new();
    let src_path = path::PathBuf::from("./src");

    for src_path_part in fs::canonicalize(&src_path).iter() {
        for entry in src_path_part.to_string_lossy().split("/") {
            if entry != "" && new_path_parts.len() < 2 {
                new_path_parts.push(entry.to_string());
            }
        }
    }

    let mut new_path = path::PathBuf::from("/");
    let mut snippet_name_parts: Vec<String> = Vec::new();

    for path_part in snippet_path.iter() {
        let path_part_str = path_part.to_string_lossy().to_string();

        if path_part_str != "snippets" {
            snippet_name_parts.push(path_part_str);
        }
    }

    new_path.push(new_path_parts.join("/"));
    new_path.push("Library/Application Support/Sublime Text 3/Packages/User");
    new_path.push(snippet_name_parts.join("-"));

    fs::copy(snippet_path, new_path);
}

fn install_snippets() {
    for entry in glob("snippets/**/*.sublime-snippet").expect("Failed to install snippets!") {
        match entry {
            Ok(snippet_path) => copy_snippet(snippet_path),
            Err(e) => println!("{:?}", e),
        }
    }
}

fn main() {
    let args: Vec<String> = env::args().collect();
    let command = &args[1];

    if command == "snippets" {
        install_snippets();
    }
}
