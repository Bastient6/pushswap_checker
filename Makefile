##
## EPITECH PROJECT, 2024
## Makefile
## File description:
## Rush
##

SRC = Main.hs\
	Swap.hs\
	Checker.hs\
	Rotation.hs\
	Push.hs

GHC = ghc

TARGET = pushswap_checker

$(TARGET): $(SRC)
	$(GHC) $(SRC) -o $(TARGET)

all: $(TARGET)
	make clean

clean:
	$(RM) *.o
	$(RM) *.hi

fclean: clean
	$(RM) $(TARGET)

re: fclean all

tests_run:
	cd tests; cabal test --enable-coverage; cd ..

tests_cover:
	firefox tests/cover
