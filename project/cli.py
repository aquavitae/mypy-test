from .lib import options


# Deliberately failing type hints
def main(arg: str=None) -> int:
    print(options.hi)


if __name__ == '__main__':
    main()

