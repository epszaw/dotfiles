use glob::glob;
use std::env;
use std::fs;
use std::path;

fn get_home_dir_path() -> String {
    let mut home_path_parts: Vec<String> = Vec::new();
    let src_path = path::PathBuf::from("./src");

    for home_path_part in fs::canonicalize(&src_path).iter() {
        for entry in home_path_part.to_string_lossy().split("/") {
            if entry != "" && home_path_parts.len() < 2 {
                home_path_parts.push(entry.to_string());
            }
        }
    }

    home_path_parts.join("/")
}

fn copy_snippet(snippet_path: path::PathBuf) {
    let new_path_parts: Vec<String> = Vec::new();
    let mut new_path = path::PathBuf::from("/");
    let mut snippet_name_parts: Vec<String> = Vec::new();

    for path_part in snippet_path.iter() {
        let path_part_str = path_part.to_string_lossy().to_string();

        if path_part_str != "sublime-text-3" && path_part_str != "snippets" {
            snippet_name_parts.push(path_part_str);
        }
    }

    new_path.push(new_path_parts.join("/"));
    new_path.push(get_home_dir_path());
    new_path.push("Library/Application Support/Sublime Text 3/Packages/User");
    new_path.push(snippet_name_parts.join("-"));

    fs::copy(snippet_path, new_path);
}

fn install_snippets() {
    for entry in
        glob("./sublime-text-3/snippets/**/*.sublime-snippet").expect("Failed to install snippets!")
    {
        match entry {
            Ok(snippet_path) => copy_snippet(snippet_path),
            Err(e) => println!("{:?}", e),
        }
    }
}

fn install_nvim_config() {
    let mut new_path = path::PathBuf::from("/");

    new_path.push(get_home_dir_path());
    new_path.push(".config/nvim/init.vim");

    fs::copy("./configs/init.vim", new_path);
}

fn main() {
    let args: Vec<String> = env::args().collect();
    let command = &args[1];

    if command == "snippets" {
        install_snippets();
    } else if command == "nvim" {
        install_nvim_config();
    }
}
