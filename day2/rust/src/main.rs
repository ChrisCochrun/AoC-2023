use std::fs::read_to_string;

fn main() {
    if let Ok(string) = read_to_string("/home/chris/dev/AoC-2023/day2/input.txt") {
        let red = 12;
        let green = 13;
        let blue = 14;
        let vec: Vec<&str> = string.split('\n').collect();
        let mut sum: usize = 0;
        let mut part2: usize = 0;
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
            let mut highest_red: usize = 0;
            let mut highest_blue: usize = 0;
            let mut highest_green: usize = 0;
            let id = id + 1;
            println!("game: {id}: {game}");
            if game.is_empty() {
                continue;
            }
            println!("game: {id}: {game}");
            let mut game_valid = true;

            for reveal in game.split(";").map(|x| x.trim()) {
                // reenable if finding part 1
                // if game_valid {
                println!("reveal : {reveal}");
                for color in reveal.split(",").map(|x| x.trim()) {
                    let mut split = color.split_whitespace();
                    if let Some(num) = split.next() {
                        if let Some(color) = split.next() {
                            match color {
                                "red" => {
                                    if let Ok(num) = num.parse::<i32>() {
                                        if num as usize > highest_red {
                                            highest_red = num as usize
                                        }
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
                                        if num as usize > highest_green {
                                            highest_green = num as usize
                                        }
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
                                        if num as usize > highest_blue {
                                            highest_blue = num as usize
                                        }
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
                    //reenable if finding part1
                    // }
                }
            }
            part2 = part2 + highest_red * highest_blue * highest_green;
            println!("{}", part2);
            println!("{}", highest_red);
            println!("{}", highest_blue);
            println!("{}", highest_green);
            if game_valid {
                sum += id
            }
        }
        println!("{}", sum);
    }
}
