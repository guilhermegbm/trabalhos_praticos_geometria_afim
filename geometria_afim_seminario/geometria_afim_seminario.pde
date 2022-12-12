
float[][] ponto1 = {{300}, 
                    {200}};

float[][] ponto2 = {{300}, 
                    {300}};
                    
float[][] ponto3 = {{350},
                    {350}};
 
float angulo1 = PI/32;
float[][] matRot1 = {{cos(angulo1), -sin(angulo1)},
                    {sin(angulo1), cos(angulo1)}};
                    
float angulo2 = -PI/64;
float[][] matRot2 = {{cos(angulo2), -sin(angulo2)},
                    {sin(angulo2), cos(angulo2)}};
                    
MatrizUtils mUtils = new MatrizUtils();

void setup() {
    size(600, 600);
    
    //float[] ponto2Transladado = {ponto2[0]-ponto1[0], ponto2[1]-ponto1[1]};
    
    //println(mUtils.transporMatriz(mUtils.multiplicarMatrizes(rotMat, mUtils.tranporMatriz(ponto2Transladado))););
    float[][] ponto2Transladado = {{ponto2[0][0]-ponto1[0][0]}, {ponto2[1][0]-ponto1[1][0]}};
    
    float[][] ponto2Rotacionado = mUtils.multiplicarMatrizes(matRot1, ponto2Transladado);
    
    float[][] abc = new float[][]{{ponto2Rotacionado[0][0]+ponto1[0][0]}, {ponto2Rotacionado[1][0]+ponto1[1][0]}};
    
    this.mUtils.printarMatriz(abc);
}

void draw() {
    delay(50);
    background(0);
    
    stroke(230, 225, 28);
    
    line(ponto1[0][0], ponto1[1][0], ponto2[0][0], ponto2[1][0]);
    line(ponto2[0][0], ponto2[1][0], ponto3[0][0], ponto3[1][0]);
    
    //Rotacionando os pontos
    
    //Ponto 2 em torno do ponto 1
    float[][] ponto2Transladado = {{ponto2[0][0]-ponto1[0][0]}, {ponto2[1][0]-ponto1[1][0]}};
    
    float[][] ponto2Rotacionado = mUtils.multiplicarMatrizes(matRot1, ponto2Transladado);
    
    this.ponto2 = new float[][]{{ponto2Rotacionado[0][0]+ponto1[0][0]}, {ponto2Rotacionado[1][0]+ponto1[1][0]}};
    
    //Ponto 3 em torno do ponto 1 primeiro
    float[][] ponto3Transladado_1 = {{ponto3[0][0]-ponto1[0][0]}, {ponto3[1][0]-ponto1[1][0]}};
    
    float[][] ponto3Rotacionado_1 = mUtils.multiplicarMatrizes(matRot1, ponto3Transladado_1);
    
    this.ponto3 = new float[][]{{ponto3Rotacionado_1[0][0]+ponto1[0][0]}, {ponto3Rotacionado_1[1][0]+ponto1[1][0]}};
    
    //Ponto 3 em torno do ponto 2 depois
    float[][] ponto3Transladado_2 = {{ponto3[0][0]-ponto2[0][0]}, {ponto3[1][0]-ponto2[1][0]}};
    
    float[][] ponto3Rotacionado_2 = mUtils.multiplicarMatrizes(matRot2, ponto3Transladado_2);
    
    this.ponto3 = new float[][]{{ponto3Rotacionado_2[0][0]+ponto2[0][0]}, {ponto3Rotacionado_2[1][0]+ponto2[1][0]}};
}
