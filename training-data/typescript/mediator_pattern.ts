interface Mediator {
  notify(sender: Component, event: string): void;
}

abstract class Component {
  protected mediator?: Mediator;

  setMediator(mediator: Mediator): void {
    this.mediator = mediator;
  }
}

class TextBox extends Component {
  private text = "";

  setText(text: string): void {
    this.text = text;
    this.mediator?.notify(this, "textChanged");
  }

  getText(): string {
    return this.text;
  }
}

class SubmitButton extends Component {
  private enabled = false;

  setEnabled(enabled: boolean): void {
    this.enabled = enabled;
    console.log(`SubmitButton enabled=${enabled}`);
  }

  click(): void {
    if (this.enabled) {
      this.mediator?.notify(this, "submit");
    } else {
      console.log("click ignored: button disabled");
    }
  }
}

class FormMediator implements Mediator {
  constructor(private textBox: TextBox, private submitButton: SubmitButton) {
    textBox.setMediator(this);
    submitButton.setMediator(this);
  }

  notify(sender: Component, event: string): void {
    if (sender === this.textBox && event === "textChanged") {
      this.submitButton.setEnabled(this.textBox.getText().length > 0);
    } else if (sender === this.submitButton && event === "submit") {
      console.log(`submitting: "${this.textBox.getText()}"`);
    }
  }
}

const textBox = new TextBox();
const button = new SubmitButton();
new FormMediator(textBox, button);

button.click();
textBox.setText("hello");
button.click();
