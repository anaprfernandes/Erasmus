
// Criação dos bracos da cruz
braco_horizontal = [5, 1.87, 10];
braco_vertical = [1.87, 5, 10];

// União dos bracos da cruz
module cruz(){
    union() {
    cube(braco_horizontal, center=true);
    cube(braco_vertical, center=true);
    }
}

// Parâmetros da engrenagem
modulo = 1; // Módulo da engrenagem
n_dentes = 40; // Número de dentes
altura_dente = 2; // Altura do dente
largura_dente = 7; // Largura do dente

// Função para criar um único dente assimétrico
module dente_assimetrico() {
    difference() {
        scale([largura_dente, altura_dente / 2, 6])
            cube(1, center=true);
        translate([largura_dente / 2, 0, 0])
            rotate([0, 0, 45]) // Ajuste o ângulo de inclinação do dente aqui
                scale([1, 7, 7])
                    cube(1, center=true);
    }
}
module engrenagem() {
    for (i = [0:n_dentes - 1]) {
        angulo = 360 / n_dentes * i;
        rotate([0, 0, angulo])
            translate([(largura_dente / 2), 0, 0])
            dente_assimetrico();
    }
}


//Functions
module final_gear(){
    difference(){
    engrenagem();
    cruz();
    }
}

//Render the piece
rotate([90,0,0])
final_gear();
