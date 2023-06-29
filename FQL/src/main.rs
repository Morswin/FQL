use std::env;


// struct Path {}
// struct File {}
// struct QuerryInterpreter {}


fn parse_is_querry(arg: &String) -> bool {
    /* Checks whether the argument looks like a executable FQL */
    /* For now it just needs to start and end with the same 
     *  type of str indication symbol. For now, let's awwume that
     *  ' " and ` are the correct symbols to wrap the FQL argument.
     */
    let arg_chars: Vec<char> = arg.chars().collect();
    println!("{:?}", arg_chars);
    let right_symbol: bool = match arg_chars[0] {
        '"' | '\'' | '`' => true,
        _ => false
    };
    println!("{:?}", right_symbol);
    if arg_chars[0] == arg_chars[arg_chars.len() - 1] && right_symbol {
        return true;
    }
    return false;
}


fn main() {
    let args: Vec<String> = env::args().collect();
    println!("{:?}", args);  // a debug
    /* Parse run arguments */
    let mut omit_first: bool = true;
    let mut break_parsing:bool = false;
    let mut querry: Option<String> = None;
    for arg in args {
        if omit_first {
            omit_first = false;
            continue;
        }

        if break_parsing {
            break;
        }

        if parse_is_querry(&arg) {
            /* This is a querry and */
            println!("FQL argument detected.");
            querry = Some(arg);
        }
        else {
            println!("An invalid argument has been provided:");
            println!("{:?}", arg);
            break_parsing = true
        }
    }
    println!("{:?}", querry)
    /*  */
}
