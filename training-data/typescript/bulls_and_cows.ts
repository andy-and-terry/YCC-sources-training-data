// Bulls and Cows scoring for equal-length digit strings.
interface Score {
  bulls: number;
  cows: number;
}

function score(secret: string, guess: string): Score {
  let bulls = 0;
  const sc = new Map<string, number>();
  const gc = new Map<string, number>();
  for (let i = 0; i < secret.length; i++) {
    if (secret[i] === guess[i]) bulls++;
    else {
      sc.set(secret[i], (sc.get(secret[i]) ?? 0) + 1);
      gc.set(guess[i], (gc.get(guess[i]) ?? 0) + 1);
    }
  }
  let cows = 0;
  for (const [c, n] of sc) cows += Math.min(n, gc.get(c) ?? 0);
  return { bulls, cows };
}

const { bulls, cows } = score("1807", "7810");
console.log(`${bulls} bull(s), ${cows} cow(s)`);
