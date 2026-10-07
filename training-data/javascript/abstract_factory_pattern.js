// Abstract Factory: produce families of related objects (a UI theme's
// button + checkbox) without the client code knowing the concrete classes.
class LightButton {
  render() {
    return 'light button';
  }
}

class LightCheckbox {
  render() {
    return 'light checkbox';
  }
}

class DarkButton {
  render() {
    return 'dark button';
  }
}

class DarkCheckbox {
  render() {
    return 'dark checkbox';
  }
}

class LightThemeFactory {
  createButton() {
    return new LightButton();
  }

  createCheckbox() {
    return new LightCheckbox();
  }
}

class DarkThemeFactory {
  createButton() {
    return new DarkButton();
  }

  createCheckbox() {
    return new DarkCheckbox();
  }
}

function renderUi(factory) {
  const button = factory.createButton();
  const checkbox = factory.createCheckbox();
  return [button.render(), checkbox.render()];
}

console.log(renderUi(new LightThemeFactory()));
console.log(renderUi(new DarkThemeFactory()));

module.exports = { LightThemeFactory, DarkThemeFactory };
