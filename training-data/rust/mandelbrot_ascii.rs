fn escape(cr: f64, ci: f64) -> u32 {
    let (mut zr, mut zi) = (0.0, 0.0);
    for n in 0..30 {
        if zr * zr + zi * zi >= 4.0 {
            return n;
        }
        (zr, zi) = (zr * zr - zi * zi + cr, 2.0 * zr * zi + ci);
    }
    30
}

fn main() {
    for yi in -5..=5 {
        let line: String = (-40..=12)
            .map(|xi| if escape(xi as f64 / 20.0, yi as f64 / 5.0) == 30 { '#' } else { '.' })
            .collect();
        println!("{line}");
    }
}
