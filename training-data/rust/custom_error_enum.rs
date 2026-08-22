use std::fmt;

#[derive(Debug)]
enum ApiError {
    NotFound(String),
    Unauthorized,
    ServerError { code: u16, message: String },
}

impl fmt::Display for ApiError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            ApiError::NotFound(resource) => write!(f, "{} not found", resource),
            ApiError::Unauthorized => write!(f, "unauthorized"),
            ApiError::ServerError { code, message } => write!(f, "server error {}: {}", code, message),
        }
    }
}

impl std::error::Error for ApiError {}

fn fetch_resource(id: i32) -> Result<String, ApiError> {
    if id < 0 {
        return Err(ApiError::Unauthorized);
    }
    if id > 100 {
        return Err(ApiError::NotFound(format!("resource {}", id)));
    }
    Ok(format!("resource-{}", id))
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    match fetch_resource(999) {
        Ok(r) => println!("{}", r),
        Err(e) => println!("error: {}", e),
    }
    let r = fetch_resource(5)?;
    println!("{}", r);
    Ok(())
}
