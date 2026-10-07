class CPU:
    def freeze(self) -> str:
        return "CPU: freeze"

    def jump(self, position: int) -> str:
        return f"CPU: jump to {position}"

    def execute(self) -> str:
        return "CPU: execute"


class Memory:
    def load(self, position: int, data: str) -> str:
        return f"Memory: load '{data}' at {position}"


class HardDrive:
    def read(self, sector: int, size: int) -> str:
        return f"HardDrive: read {size} bytes from sector {sector}"


class ComputerFacade:
    """Hides the coordination between subsystems behind one simple call."""

    BOOT_SECTOR = 0
    BOOT_SIZE = 1024
    BOOT_ADDRESS = 0

    def __init__(self):
        self.cpu = CPU()
        self.memory = Memory()
        self.hard_drive = HardDrive()

    def start(self) -> list:
        log = [self.cpu.freeze()]
        data = self.hard_drive.read(self.BOOT_SECTOR, self.BOOT_SIZE)
        log.append(data)
        log.append(self.memory.load(self.BOOT_ADDRESS, "boot sector"))
        log.append(self.cpu.jump(self.BOOT_ADDRESS))
        log.append(self.cpu.execute())
        return log


if __name__ == "__main__":
    for line in ComputerFacade().start():
        print(line)
