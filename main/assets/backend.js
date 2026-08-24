//backend.js v0.1.0

const message = localStorage.getItem('message');
function chat(){
  const res = await fetch("https://andyandterry--3993b1649f9e11f19dda1607ee4eb77e.web.val.run", {
    method: "POST",
    headers: { "content-type": "application/json" },
    body: JSON.stringify({
      id: userid,
      model: "gpt-oss:20b",
      message: message
    })
  });
  const data = await res.json();
  const output = data.reply;
}
