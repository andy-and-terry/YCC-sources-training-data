type Event = "click" | "focus";
type Handler = `on${Capitalize<Event>}`;

const handlers: Record<Handler, () => void> = {
  onClick: () => console.log("click"),
  onFocus: () => console.log("focus"),
};

handlers.onClick();
