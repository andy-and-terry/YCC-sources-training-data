function debounce(fn, ms) {
  let t;
  return (...args) => {
    clearTimeout(t);
    t = setTimeout(() => fn(...args), ms);
  };
}
const log = debounce(msg => console.log(msg), 50);
log('a'); log('b'); log('c');
