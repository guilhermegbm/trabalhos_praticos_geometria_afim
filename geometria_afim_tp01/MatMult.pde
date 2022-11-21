class MatrizUtils {
  
  /*
  float a[][] = { { 1, 1, 1 },
                { 2, 2, 2 },
                { 3, 3, 3 },
                { 4, 4, 4 } };
                
  float b[][] = { { 1, 1, 1, 1 },
                { 2, 2, 2, 2 },
                { 3, 3, 3, 3 } };
                
  float v[] = {5, 0, -3};
                
  new MatrizUtils().multiplicarMatrizes(a, b);
  new MatrizUtils().tranporMatriz(b);
  new MatrizUtils().multiplicarVetorPorEscalar(v);
  new MatrizUtils().somarVetorNasLinhasDaMatriz(a, v);
  */
  
  public float[][] tranporMatriz(float[][] m) {
    float[][] r = new float[m[0].length][m.length];
    
    for (int i = 0; i < r.length; i++) {
      for (int j = 0; j < r[0].length; j++) {
        r[i][j] = m[j][i];
      }
    }
    
    //this.printarMatriz(r);
    
    return r;
  }
  
  public float[][] multiplicarMatrizes(float[][] m1, float[][] m2) {
    
    if (m1[0].length != m2.length) {
      println("Numero de colunas de m1 difere do número de linhas de m2. NÃO é possível fazer a multiplicação!!!");
      return null;
      // throw new Exception("Numero de colunas de m1 difere do número de linhas de m2. NÃO é possível fazer a multiplicação!!!");
    }
    
    float[][] r = new float[m1.length][m2[0].length];
    
    for (int i = 0; i < r.length; i++) {
      for (int j = 0; j < r[0].length; j++) {
        
        float soma = 0;
        for (int k = 0; k < m2.length; k++) {
          soma += m1[i][k] * m2[k][j];
        }
        
        r[i][j] = soma;
      }
    }
    
    //this.printarMatriz(r);
    
    return r;
  }
  
  public float[] multiplicarVetorPorEscalar(float[] vet, float escalar) {
    float[] r = new float[vet.length];
    
    for (int i = 0; i < vet.length; i++) {
      r[i] = vet[i] * escalar;
    }
    
    return r;
  }
  
  public float[][] somarVetorNasLinhasDaMatriz(float[][] m, float[] vet) {
    
    if (vet.length != m[0].length) {
      return null;
      // throw new Exception("Numero de colunas de m difere do número de elementos de vet. NÃO é possível fazer a soma!!!");
    }
    
    float[][] r = new float[m.length][m[0].length];
    
    for (int i = 0; i < r.length; i++) {
      for (int j = 0; j < r[0].length; j++) {
        r[i][j] = m[i][j] + vet[j];
      }
    }
    
    return r;
  }
  
  public void printarMatriz(float r[][]) {
        for (int i = 0; i < r.length; i++) {
            for (int j = 0; j < r[0].length; j++) {
                print(r[i][j] + " ");
            }
            println();
        }
    }
}
