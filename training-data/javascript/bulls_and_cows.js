// Bulls and Cows scoring for equal-length digit strings.
function score(secret, guess) {
  let bulls = 0;
  const sc = {}, gc = {};
  for (let i = 0; i < secret.length; i++) {
    if (secret[i] === guess[i]) bulls++;
    else {
      sc[secret[i]] = (sc[secret[i]] || 0) + 1;
      gc[guess[i]] = (gc[guess[i]] || 0) + 1;
    }
  }
  const cows = Object.keys(sc).reduce((t, c) => t + Math.min(sc[c], gc[c] || 0), 0);
  return { bulls, cows };
}

const { bulls, cows } = score("1807", "7810");
console.log(`${bulls} bull(s), ${cows} cow(s)`);
