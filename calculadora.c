#include <stdio.h>

int main() {
    float num1, num2, resultado;
    int opcao;

    do {
        // Menu de opções
        printf("===== CALCULADORA COM MENU =====\n");
        printf("1. Adicao (+)\n");
        printf("2. Subtracao (-)\n");
        printf("3. Multiplicacao (*)\n");
        printf("4. Divisao (/)\n");
        printf("0. Sair\n");
        printf("Escolha uma opcao: ");
        scanf("%d", &opcao);

        if (opcao == 0) {
            printf("Encerrando a calculadora. Ate mais!\n");
            break;
        }

        // Solicita os dois números
        printf("Digite o primeiro numero: ");
        scanf("%f", &num1);
        printf("Digite o segundo numero: ");
        scanf("%f", &num2);

        switch (opcao) {
            case 1:
                resultado = num1 + num2;
                printf("Resultado: %.2f + %.2f = %.2f\n", num1, num2, resultado);
                break;
            case 2:
                resultado = num1 - num2;
                printf("Resultado: %.2f - %.2f = %.2f\n", num1, num2, resultado);
                break;
            case 3:
                resultado = num1 * num2;
                printf("Resultado: %.2f * %.2f = %.2f\n", num1, num2, resultado);
                break;
            case 4:
                if (num2 == 0) {
                    printf("Erro: divisao por zero nao é permitida.\n");
                } else {
                    resultado = num1 / num2;
                    printf("Resultado: %.2f / %.2f = %.2f\n", num1, num2, resultado);
                }
                break;
            default:
                printf("Opcao invalida. Tente novamente.\n");
        }

        printf("\n");

    } while (1); // Loop infinito até o usuário digitar 0

    return 0;
}