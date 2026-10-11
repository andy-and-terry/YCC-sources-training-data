interface Button {
  render(): string;
}
interface Checkbox {
  render(): string;
}

interface WidgetFactory {
  createButton(label: string): Button;
  createCheckbox(checked: boolean): Checkbox;
}

class LightFactory implements WidgetFactory {
  createButton(label: string): Button {
    return { render: () => `[ ${label} ]` };
  }
  createCheckbox(checked: boolean): Checkbox {
    return { render: () => (checked ? "[x]" : "[ ]") };
  }
}

class DarkFactory implements WidgetFactory {
  createButton(label: string): Button {
    return { render: () => `<<${label.toUpperCase()}>>` };
  }
  createCheckbox(checked: boolean): Checkbox {
    return { render: () => (checked ? "(#)" : "( )") };
  }
}

function buildForm(factory: WidgetFactory): string[] {
  return [factory.createCheckbox(true).render(), factory.createButton("Save").render()];
}

console.log(buildForm(new LightFactory()));
console.log(buildForm(new DarkFactory()));
