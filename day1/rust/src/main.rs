use std::fs::read_to_string;

fn main() {
    if let Ok(string) = read_to_string("../input.txt") {
        let vec: Vec<&str> = string.split('\n').collect();
        let mut sum = 0;
        let num_strs = vec![
            "one", "two", "three", "four", "five", "six", "seven", "eight", "nine",
        ];
        for i in vec {
            if i.is_empty() {
                println!("{sum}");
                return;
            }
            let mut first_int_pos = i.find(char::is_numeric).unwrap();
            let mut last_int_pos = i.rfind(char::is_numeric).unwrap();
            let mut first_int = String::from("0");
            let mut last_int_string = String::from("0");
            let last_index = i.trim_end_matches(char::is_alphabetic).len() - 1;
            let (_index, mut last_int) = i
                .char_indices()
                .filter(|(i, _x)| i == &last_index)
                .next()
                .unwrap_or_else(|| (0, char::from_u32(0).unwrap()));
            println!("{i}");
            first_int = i
                .trim_start_matches(char::is_alphabetic)
                .get(..1)
                .unwrap()
                .to_string();
            for (index, strs) in num_strs.iter().enumerate() {
                if let Some(first) = i.find(strs) {
                    if first < first_int_pos {
                        println!("THIS is FIRST: {}", first);
                        println!("THIS is not: {}", first_int_pos);
                        first_int_pos = first;
                        first_int = (index + 1).to_string();
                    }
                }
                if let Some(last) = i.rfind(strs) {
                    if last > last_int_pos {
                        println!("REAL LAST POS: {}", last);
                        println!("REAL LAST: {}", strs);
                        println!("NOT LAST: {}", last_int_pos);
                        last_int_pos = last;
                        last_int_string = (index + 1).to_string();
                        last_int = *last_int_string
                            .chars()
                            .collect::<Vec<char>>()
                            .first()
                            .unwrap();
                        println!("REAL LAST: {}", last_int_string);
                    }
                }
            }

            let mut cv = first_int.to_string();
            if last_int_string.parse::<i32>().unwrap() > last_int.to_string().parse().unwrap() {
                let chars: Vec<char> = last_int_string.chars().collect();
                cv.push(*chars.first().unwrap());
            } else {
                cv.push(last_int);
            }

            // let last_int = last_int.to_digit(10).unwrap();
            let calibration_value: i32 = cv.parse().unwrap();

            println!("first: {:?}", first_int);
            println!("last: {:?}", last_int);
            // println!("{i}");
            // println!("{:?}", calibration_value);
            sum = sum + calibration_value;
        }
    } else {
        println!("uhhhh");
    }
}
