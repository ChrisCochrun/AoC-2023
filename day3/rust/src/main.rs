fn main() {
    println!("Hello, world!");
}

fn lines() {
    if let Ok(input) = read_to_string("../input.txt") {
        let lines = input.split("\n").collect();
    }
}
