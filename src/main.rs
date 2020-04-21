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
    let snippet_name = snippet_path
      .iter()
      .map(|path_part| path_part.to_str().unwrap())
      .filter(|path_part| !["sublime-text-3", "snippets"].contains(path_part))
      .collect::<Vec<_>>()
      .join("-");
    let new_path = path::PathBuf::from("/")
      .join(get_home_dir_path())
      .join("Library/Application Support/Sublime Text 3/Packages/User")
      .join(&snippet_name);

    match fs::copy(snippet_path, new_path) {
        Ok(_) => println!("✅  Snipped created: {:?}", snippet_name),
        Err(err) => println!("❌  Snippet was not created: {:?}", err),
    }
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

fn main() {
    let args: Vec<String> = env::args().collect();
    let command = &args[1];

    if command == "snippets" {
        install_snippets();
    } else {
        println!("This command is not supported yet. Copy this config by yourself.")
    }
}
