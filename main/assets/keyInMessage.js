//keyInMessage.js V0.1.0

document.querySelector('[name="chatText"]').addEventListener('keydown', function(e) {
	if (e.key === 'Enter' && !e.shiftKey) {
		e.preventDefault();
		localStorage.setItem('message', encodeURIComponent(this.value));
		this.value = '';
	}
});