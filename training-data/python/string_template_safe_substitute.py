from string import Template

tpl = Template("Hello $name, you owe $$${amount} to $who")

if __name__ == "__main__":
    print(tpl.substitute(name="Ann", amount=10, who="Bob"))
    print(tpl.safe_substitute(name="Ann"))
