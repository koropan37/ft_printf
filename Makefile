# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: skimura <skimura@student.42tokyo.jp>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/05/15 18:31:02 by skimura           #+#    #+#              #
#    Updated: 2025/05/24 18:02:43 by skimura          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

MAKEFLAGS += --no-print-directory

NAME 		= libftprintf.a

SRCS 		= \
				ft_printf.c \
				ft_printf_str.c\
				ft_printf_number.c

OBJS = $(SRCS:.c=.o)

LIBFT_DIR 	= libft
LIBFT_LIB 	= $(LIBFT_DIR)/libft.a

CC		 	= cc
CFLAGS 		= -Wall -Wextra -Werror
AR 			= ar
ARFLAGS 	= rcs
RM 			= rm -f

INCLUDES  	= -I . -I $(LIBFT_DIR)

all: $(NAME)

$(LIBFT_LIB):
	@$(MAKE) -C $(LIBFT_DIR)

$(NAME): $(LIBFT_LIB) $(OBJS)
	@cp $(LIBFT_LIB) $@
	@$(AR) $(ARFLAGS) $@ $(OBJS)
	@echo "make libftprintf.a"

%.o: %.c
	@$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@
clean:
	@$(MAKE) -C $(LIBFT_DIR) clean
	@$(RM) $(OBJS)
	@echo "clean printf"


fclean: clean
	@$(MAKE) -C $(LIBFT_DIR) fclean
	@$(RM) $(NAME)
	@echo "all clean libftprintf.a"

# main: mainpf.c $(NAME)
# 	@$(CC) $(CFLAGS) mainpf.c $(NAME) -o a.out
# 	@echo "test main"

# test: main

re: fclean all

.PHONY: all clean fclean re #test
