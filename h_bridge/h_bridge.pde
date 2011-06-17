
boolean
  switchOutputAllow = true;

int
  switchAction = LOW,
  valueButtonSwitch = LOW,
  valueButtonTurn = 0;

const int
  turnPin = A0,         // 
  switchPin = 2,        // button
  motor1Pin1 = 3,       // motor 1 direction 1
  motor1Pin2 = 4,       // motor 1 direction 2
  motor1Enga = 6,       // motor 1 on/off
  motor2Pin1 = 9,       // motor 2 direction 1
  motor2Pin2 = 10,      // motor 2 direction 2
  motor2Enga = 12,      // motor 2 on/off
  switchOutputLed = 13; // motor on/off led

void setup() {
  Serial.begin(9600);
  pinMode(turnPin, INPUT);
  pinMode(switchPin, INPUT);
  pinMode(motor1Pin1, OUTPUT);
  pinMode(motor1Pin2, OUTPUT);
  pinMode(motor1Enga, OUTPUT);
  pinMode(motor2Pin1, OUTPUT);
  pinMode(motor2Pin2, OUTPUT);
  pinMode(motor2Enga, OUTPUT);
  pinMode(switchOutputLed, OUTPUT);

  // rodar motor 1 em sentido horario
  digitalWrite(motor1Pin1, LOW);
  digitalWrite(motor1Pin2, HIGH);
  digitalWrite(motor1Enga, LOW);

  // rodar motor 2 em sentido anti-horario
  digitalWrite(motor2Pin1, HIGH);
  digitalWrite(motor2Pin2, LOW);
  digitalWrite(motor2Enga, LOW);

  // led smd desligado
  digitalWrite(switchOutputLed, LOW);
}

void loop() {
  // read what is needed
  valueButtonSwitch = digitalRead(switchPin);
  valueButtonTurn = map(analogRead(turnPin), 0, 1023, 0, 255);
  ///////////////////////////////////////
  // check if button was pressed
  if(valueButtonSwitch == LOW && switchOutputAllow == true)
  {
      switchOutputAllow = false;
      if(switchAction == LOW)
      {
          switchAction = HIGH;
      }
      else
      {
          switchAction = LOW;
      }
  }
  // check if button was released
  if(valueButtonSwitch == HIGH && switchOutputAllow == false)
  {
      switchOutputAllow = true;
  }
  // set values from switch
  digitalWrite(motor1Enga, switchAction);
  digitalWrite(motor2Enga, switchAction);
  digitalWrite(switchOutputLed, switchAction);
  ///////////////////////////////////////
  // check position of turn button to set motor rotation
  if(valueButtonTurn > 170)
  {
    digitalWrite(motor1Pin1, LOW);
    digitalWrite(motor1Pin2, HIGH);
    digitalWrite(motor2Pin1, LOW);
    digitalWrite(motor2Pin2, HIGH);
  }
  else if(valueButtonTurn < 85)
  {
    digitalWrite(motor1Pin1, HIGH);
    digitalWrite(motor1Pin2, LOW);
    digitalWrite(motor2Pin1, HIGH);
    digitalWrite(motor2Pin2, LOW);
  }
  else
  {
    //digitalWrite(motor1Enga, LOW);
    //digitalWrite(motor2Enga, LOW);
    
    digitalWrite(motor1Pin1, LOW);
    digitalWrite(motor1Pin2, HIGH);
    digitalWrite(motor2Pin1, HIGH);
    digitalWrite(motor2Pin2, LOW);
  }
  ///////////////////////////////////////
  // set output
  Serial.print("Status: ");
  Serial.print((switchAction == 1 ? "ON " : "OFF"));
  Serial.print(" | Turn: ");
  Serial.print(valueButtonTurn);
  Serial.print("\n");
}


/*
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

// função que recebe um número variável de argumentos
int somar(int n_args, ...){
  int i, soma = 0;
  va_list ap; // declara o objeto va_list
  va_start(ap, n_args); // inicializa va_list
  
  //  percorre os valores no va_list
  for(i = 1; i <= n_args; i++){
    soma = soma + va_arg(ap, int);      
  }
  
  // limpa o objeto va_list
  va_end(ap);
  
  return soma; 
}

int main(int argc, char *argv[]){
  // o valor exibido será 15
  // o valor 4 é usado para informar a quantidade de
  // argumentos sendo fornecidos
  printf("Soma: %d\n\n", somar(4, 5, 3, 2, 5));
  
  system("PAUSE");	
  return 0;
}










#include <stdio.h>

// Declaração da classe1
class classe1
  {
  public:		// Métodos públicos da classe1
    classe1(void);		// Construtor 1
    classe1(char *);	// Construor alternativo
    virtual ~classe1();		// Destrutor da classe1
// A implementação de um método pode ser feita na própria declaração
    inline char *pega_nome(void) { return nome; };
// "virtual" significa que o método pode ser reimplementado em classes decendentes
    virtual char *escreve(void);
    void novo_nome(char *);
// protected significa que o dado a seguir é acessivel de dentro desta
// classe e também pelos métodos das classes descendentes, mas não de fora da classe
  protected:
    char *nome;		// Dado prvado da classe
  };

// Implementação do construtor da classe1
classe1::classe1(void)
{
nome = new char[256];	// Aloca memória para o nome
novo_nome("Sem Nome");	// Armazena um nome default
}

// Construtor alternativo da classe1 (especificando o nome)
classe1::classe1(char *str)
{
nome = new char[256];
novo_nome(str);
}

// Destrutor: Libera a memória alocada pelo objeto
classe1::~classe1()
{
delete nome;
}

// Implementação do método escreve
char * classe1::escreve()
{
puts(nome);	// Escreve o nome
return nome;
}

// Método para preencher o nome do objeto da classe1
void classe1::novo_nome(char *str)
{
int k;
for(k=0; str[k] && k<255; k++) nome[k]=str[k];
nome[k]='\0';
}

// A classe2 herda as propriedades da classe1 acrescentando as
// suas próprias propriedades
class classe2:classe1
  {
  public:
// O contrutor da classe2 executa o construtor da classe1 e faz suas
// próprias inicializações
    classe2() : classe1() { numero=43; };
// muda_numero e pega_número são métodos exclusivos da classe2	
    inline void muda_numero(int n) { numero=n; };
    inline int pega_numero();
// escreve é uma reimplementação do método virtual escreve da classe1
    char * escreve();
  private:
// Dado privado adicional da classe2:
// somente os métodos desta classe podem acessar dados privados
    int numero;
  };

// Métodos tipo inline são compilados em linha diretamente no
// programa, sem chamar subrotina. 
// Isto é recomendado para oprações muito pequenas.
inline int classe2::pega_numero()
{
return numero;
}

// Reimplementação do método virtual escreve
char * classe2::escreve()
{
printf("Nume=\"%s\"  Numero=%d\n", nome, numero);
return nome;
}

int main()
{
// obj1 é um objeto da classe1
// pobj2 é um apontador para objeto da classe1
classe1 obj1, *pobj2;
// new aloca memória para um objeto referenciado por apontado
pobj2 = new classe1("Objeto2");
// Como obj1 é o próprio objeto, seus métodos são referenciados por "." (ponto)
obj1.escreve();
// pobj2 é um apontador. O método é referenciado usando "->"
pobj2->escreve();
// Testa os métodos novo_nome e pega_nome
obj1.novo_nome("Novo nome do Objeto1");
puts(obj1.pega_nome());

// Cria um objeto da classe2 (descendente da classe1)
classe2 cl2_obj;
cl2_obj.escreve();	// escreve da classe2 tambem escreve o número.
return 0;
}

*/
