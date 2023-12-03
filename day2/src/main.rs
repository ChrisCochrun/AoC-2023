use std::fs::read_to_string;

fn main() {
    if let Ok(string) = read_to_string("/home/chris/dev/AoC-2023/day2/input.txt") {
        let red = 12;
        let green = 13;
        let blue = 14;
        let vec: Vec<&str> = string.split('\n').collect();
        for game in vec.iter().map(|x| {
            let pref_index = x.find(":").unwrap();
            x.to_string().split_off(pref_index + 2)
        }) {
            for reveal in game.split(";");
            println!("{:?}", game);
        }
    }
}
