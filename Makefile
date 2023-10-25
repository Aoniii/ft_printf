-include ./configuration/Sources.mk
-include ./configuration/Includes.mk
-include ./configuration/Bonus.mk

NAME			= libftprintf.a

CC				= clang
CFLAGS			= -Wall -Wextra -Werror -I $(INCLUDES_DIR)

OBJS			= $(SRCS:.c=.o)
OBJS_DIR 		= objects
OBJS_PATH		= $(addprefix $(OBJS_DIR)/, $(OBJS))

BONUS_OBJS		= $(BONUS_SRCS:.c=.o)
BONUS_OBJS_DIR 	= objects_bonus
BONUS_OBJS_PATH	= $(addprefix $(BONUS_OBJS_DIR)/, $(BONUS_OBJS))

$(OBJS_DIR)/%.o: %.c
	@mkdir -p $(@D)
	@$(CC) $(CFLAGS) -c $< -o $@
	@printf "\033[2K\r\033[3;35m$<: \033[3;36mloading..\033[0m"

$(BONUS_OBJS_DIR)/%.o: %.c
	@mkdir -p $(@D)
	@$(CC) $(CFLAGS) -c $< -o $@
	@printf "\033[2K\r\033[3;35m$<: \033[3;36mloading..\033[0m"

$(NAME): $(OBJS_PATH)
	@ar rcs $(NAME) $(OBJS_PATH)
	@printf "\033[2K\r\033[4;34m$(NAME):\033[0m \033[1;32mCompiled [√]\033[0m\n"

all: $(NAME)

clean:
	@rm -rf $(OBJS_DIR)
	@rm -rf $(BONUS_OBJS_DIR)
	@printf "\033[2K\r\033[4;34m$(NAME):\033[0m \033[1;31mObject Delete \033[1;32m[√]\033[0m\n"

fclean: clean
	@rm -rf $(NAME)
	@printf "\033[2K\r\033[4;34m$(NAME):\033[0m \033[1;31m$(NAME) Delete \033[1;32m[√]\033[0m\n"

re: fclean all

bonus: $(BONUS_OBJS_PATH)
	@rm -rf $(NAME)
	@ar rcs $(NAME) $(BONUS_OBJS_PATH)
	@printf "\033[2K\r\033[4;34m$(NAME):\033[0m \033[1;32mCompiled [√]\033[0m\n"

.PHONY: all clean fclean re bonus