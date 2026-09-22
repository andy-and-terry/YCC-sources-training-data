// GoF Abstract Factory: families of related products created through a
// single interface, without the client naming concrete classes.
class WindowsButton {
  render() {
    return 'rendering a Windows-style button';
  }
}

class WindowsCheckbox {
  render() {
    return 'rendering a Windows-style checkbox';
  }
}

class MacButton {
  render() {
    return 'rendering a Mac-style button';
  }
}

class MacCheckbox {
  render() {
    return 'rendering a Mac-style checkbox';
  }
}

class WindowsFactory {
  createButton() {
    return new WindowsButton();
  }
  createCheckbox() {
    return new WindowsCheckbox();
  }
}

class MacFactory {
  createButton() {
    return new MacButton();
  }
  createCheckbox() {
    return new MacCheckbox();
  }
}

function getFactory(os) {
  const factories = { windows: WindowsFactory, mac: MacFactory };
  const Ctor = factories[os];
  if (!Ctor) throw new Error(`unknown os: ${os}`);
  return new Ctor();
}

function renderUi(factory) {
  const button = factory.createButton();
  const checkbox = factory.createCheckbox();
  return [button.render(), checkbox.render()];
}

console.log(renderUi(getFactory('windows')));
console.log(renderUi(getFactory('mac')));

module.exports = { WindowsFactory, MacFactory, getFactory, renderUi };
