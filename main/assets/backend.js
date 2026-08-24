//backend.js v0.1.0

const message = localStorage.getItem('message');
const url = `YOUR_VAL_URL/?message=${message}&userid=${userid}`;
const output = await fetch(url).then(res => res.text());