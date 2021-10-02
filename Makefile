NAME = minishell
SRCS = srcs/main.c srcs/env/shlvl.c utils/fd.c utils/init.c
OBJS = ${SRCS:.c=.o}

CC = gcc
CFLAGS = -Wall -Wextra -Werror

RM = rm -rf

all: ${NAME} 
	${NAME}:${OBJS}
		@echo "\n"
		@${MAKE} -C ./libft/
		@echo "\033[0;32mCompiling minishell..."
		@${CC} ${CFLAGS} ${OBJ} ./libft/libft.a -o ${NAME} 	
		@echo "\n\033[0mDone !"

clean:
	@echo "\033[0;31mCleaning libft..."
	@${MAKE} clean -C ./libft/
	@echo "\nRemoving binaries..."
	@${RM} ${OBJS}
	@echo "\033[0m"

fclean:
	@echo "\033[0;31mCleaning libft..."
	@make fclean -C ./libft/
	@echo "\nDeleting objects..."
	@${RM} ${OBJS}
	@echo "\nDeleting executable..."
	@${RM} ${NAME}
	@echo "\033[0m"

re: fclean all

.PHONY: all clean fclean re