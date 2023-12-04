use std::fs::read_to_string;

fn main() {
    if let Ok(string) = read_to_string("/home/chris/dev/AoC-2023/day2/input.txt") {
        let red = 12;
        let green = 13;
        let blue = 14;
        let vec: Vec<&str> = string.split('\n').collect();
        let mut sum: usize = 0;
        for (id, game) in vec
            .iter()
            .map(|x| {
                if x.is_empty() {
                    return String::from("");
                }
                let pref_index = x.find(":").unwrap();
                x.to_string().split_off(pref_index + 2)
            })
            .enumerate()
        {
            let id = id + 1;
            println!("game: {id}: {game}");
            if game.is_empty() {
                continue;
            }
            println!("game: {id}: {game}");
            let mut game_valid = true;

            for reveal in game.split(";").map(|x| x.trim()) {
                if game_valid {
                    println!("reveal : {reveal}");
                    for color in reveal.split(",").map(|x| x.trim()) {
                        let mut split = color.split_whitespace();
                        if let Some(num) = split.next() {
                            if let Some(color) = split.next() {
                                match color {
                                    "red" => {
                                        if let Ok(num) = num.parse::<i32>() {
                                            if num > red {
                                                game_valid = false;
                                                println!("\n{color}: {num} > {red} : game: {id}")
                                            }
                                        } else {
                                            println!("ERROR");
                                        }
                                    }
                                    "green" => {
                                        if let Ok(num) = num.parse::<i32>() {
                                            if num > green {
                                                game_valid = false;
                                                println!("\n{color}: {num} > {green} : game: {id}")
                                            }
                                        } else {
                                            println!("ERROR");
                                        }
                                    }
                                    "blue" => {
                                        if let Ok(num) = num.parse::<i32>() {
                                            if num > blue {
                                                game_valid = false;
                                                println!("\n{color}: {num} > {blue} : game: {id}")
                                            }
                                        } else {
                                            println!("ERROR");
                                        }
                                    }
                                    _ => (),
                                }
                            }
                        }
                    }
                }
            }
            if game_valid {
                sum += id
            }
        }
        println!("{}", sum);
    }
}
