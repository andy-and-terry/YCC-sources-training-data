"""Facade pattern: a simple, unified interface hides a set of more
complex subsystem classes. The client only ever talks to the facade."""


class CPU:
    def freeze(self):
        print("CPU: freezing")

    def jump(self, position: int):
        print(f"CPU: jumping to {position:#06x}")

    def execute(self):
        print("CPU: executing")


class Memory:
    def load(self, position: int, data: str):
        print(f"Memory: loading '{data}' at {position:#06x}")


class HardDrive:
    def read(self, sector: int, size: int) -> str:
        print(f"HardDrive: reading {size} bytes from sector {sector}")
        return "boot sector data"


class ComputerFacade:
    """Hides the multi-step boot sequence behind a single method."""

    BOOT_ADDRESS = 0x00
    BOOT_SECTOR = 0
    SECTOR_SIZE = 512

    def __init__(self):
        self._cpu = CPU()
        self._memory = Memory()
        self._hard_drive = HardDrive()

    def start(self):
        self._cpu.freeze()
        data = self._hard_drive.read(self.BOOT_SECTOR, self.SECTOR_SIZE)
        self._memory.load(self.BOOT_ADDRESS, data)
        self._cpu.jump(self.BOOT_ADDRESS)
        self._cpu.execute()


if __name__ == "__main__":
    computer = ComputerFacade()
    computer.start()
