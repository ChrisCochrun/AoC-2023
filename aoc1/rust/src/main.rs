use std::{
    fs::{read_to_string, File},
    path::Path,
};

fn main() {
    if let Ok(string) = read_to_string("input.txt") {
        let vec: Vec<&str> = string.split('\n').collect();
        let mut sum = 0;
        for i in vec {
            if i.is_empty() {
                println!("{sum}");
                return;
            }
            let first_int = i.trim_start_matches(char::is_alphabetic).get(..1).unwrap();
            let last_index = i.trim_end_matches(char::is_alphabetic).len() - 1;
            let (_index, last_int) = i
                .char_indices()
                .filter(|(i, _x)| i == &last_index)
                .next()
                .unwrap_or_else(|| (0, char::from_u32(0).unwrap()));
            // let last_int = last_int.to_digit(10).unwrap();
            let mut cv = first_int.to_string();
            cv.push(last_int);
            let calibration_value: i32 = cv.parse().unwrap();

            println!("first: {:?}", first_int);
            println!("last: {:?}", last_int);
            println!("{i}");
            println!("{:?}", calibration_value);
            sum = sum + calibration_value;
        }
    }
}
