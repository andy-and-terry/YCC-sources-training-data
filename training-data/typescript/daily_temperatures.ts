function dailyTemperatures(temps: number[]): number[] {
  const answer = new Array<number>(temps.length).fill(0);
  const pending: number[] = [];
  temps.forEach((t, day) => {
    while (pending.length > 0 && temps[pending[pending.length - 1]] < t) {
      const earlier = pending.pop()!;
      answer[earlier] = day - earlier;
    }
    pending.push(day);
  });
  return answer;
}

console.log(dailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73]));
