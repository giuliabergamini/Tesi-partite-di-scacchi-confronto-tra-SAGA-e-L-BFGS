# Partite di scacchi: confronto tra SAGA e L-BFGS

Codice del **Capitolo 4 (Validazione sperimentale)** della tesi di laurea triennale in Matematica.

**Metodi iterativi e minimi quadrati pesati nell'ottimizzazione per il machine learning**
Giulia Bergamini · Relatore: Prof. Alessandro Russo
Università degli Studi di Milano-Bicocca · A.A. 2025/26

## OBBIETTIVO DEL PROGETTO
Si addestra un modello di regressione logistica per prevedere l'esito di partite di scacchi e si confrontano due metodi di ottimizzazione per minimizzare la funzione di costo Log-Loss:

- **L-BFGS**, metodo quasi-Newton a memoria limitata;
- **SAGA**, metodo stocastico a riduzione della varianza.

Si confrontano la velocità di convergenza, il costo computazionale per iterazioni o epoche e l'accuratezza del modello. Lo script MATLAB
analizza il condizionamento del problema per spiegare il comportamento osservato di SAGA.

## Contenuto del repository

| File | Descrizione |
|---|---|
| `ScacchiMatematici.ipynb` | Notebook principale: preparazione dei dati (pre-processing) , addestramento del modello con L-BFGS e SAGA, valutazione delle prestazioni del modello, confronto dei risultati |
| `condizionamento.m` | Script MATLAB: numero di condizionamento della matrice dei dati, dell'Hessiana della Log-Loss regolarizzata e stima delle epoche necessarie a SAGA |
| `dati_condizionamento.mat` | Dati usati dallo script MATLAB (matrice `X`, soluzione `theta`, parametro `C`) |
| `crossover.pdf` | [Descrivere la figura, es. "Grafico di confronto tra L-BFGS e SAGA (Fig. 4.x della tesi)"] |
| `requirements.txt` | Librerie Python necessarie |

## Dati

Dataset: https://www.kaggle.com/datasets/arevel/chess-games

Scaricare il dataset da Kaggle e inserirlo direttamente nella cartella TESI-PARTITE-DI-SCACCHI-CONFRONTO-TRA-SAGA-EL-BFGS (controllare non ci siano altri file .csv).

## Come riprodurre i risultati

**Python**:

    pip install -r requirements.txt
    jupyter notebook ScacchiMatematici.ipynb

Eseguire le celle in ordine.

**MATLAB**: aprire `condizionamento.m` nella stessa cartella di `dati_condizionamento.mat` ed eseguirlo. I risultati vengono stampati nella Command Window.

## Origine del progetto

Il caso di studio nasce dal progetto di gruppo del corso di *Data Processing and Analysis* (https://github.com/giuliabergamini/Progetto-DPA-definitivo), ripreso e modificato per gli scopi della tesi.
