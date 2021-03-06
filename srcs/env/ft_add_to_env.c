#include "../../includes/minishell.h"

static int	ft_contains_equal(char *var)
{
	int i;

	i = 0;
	while (var[i])
	{
		if (var[i] == '=')
			return (1);
		i++;
	}
	return (0);
}

void	ft_add_to_env(char *var)
{
	t_env	*head;

	head = g_mini.env;
	if (!ft_contains_equal(var))
		var = ft_strjoin(var, "=");
	if (head == NULL)
		g_mini.env = new_node(var, NULL);
	else
	{
		while (head)
		{
			if (head->next == NULL)
			{
				head->next = new_node(var, NULL);
				break ;
			}
			head = head->next;
		}
	}
}
