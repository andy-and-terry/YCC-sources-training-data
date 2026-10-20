function compose(mws) {
  return (ctx) => {
    const dispatch = (i) => (i === mws.length ? Promise.resolve() : Promise.resolve(mws[i](ctx, () => dispatch(i + 1))));
    return dispatch(0);
  };
}
compose([
  async (c, next) => { c.log.push("a-in"); await next(); c.log.push("a-out"); },
  async (c, next) => { c.log.push("b"); await next(); },
])({ log: [] }).then(() => console.log("done"));
