clear all
close all

load dati_condizionamento.mat          % X (matrice m x n), theta, C
[m, n] = size(X);
Xb = [ones(m,1), X];                   % matrice delle osservazioni 
lambda = 1/(C*m);                      % parametro di regolarizzazione
theta = theta(:);

% 1) Condizionamento della matrice dei dati
kX = cond(Xb);

% 2) Condizionamento dell'Hessiana della Log-Loss regolarizzata in theta*
p = 1 ./ (1 + exp(-Xb*theta));
w = p .* (1 - p);                      % vettore dei pesi
D = eye(n+1);  D(1,1) = 0;
H = (Xb' * (w .* Xb)) / m + lambda*D;
ev = eig((H + H')/2);                  % simmetrizzazione per stabilita numerica
kH = max(ev) / min(ev);

% 3) Condizionamento kappa = L/mu del Teorema 3.14
norme2 = sum(Xb.^2, 2);
L  = 0.25*max(norme2) + lambda;
kS = L / lambda;
epoche = (1 + kS/m) * log(1e5);

Lmed = 0.25*mean(norme2) + lambda;
kmed = Lmed / lambda;
epoche_med = (1 + kmed/m) * log(1e5);

% Stampa dei risultati
fprintf('m = %d, n = %d, lambda = %.3e\n', m, n, lambda);
fprintf('rango di Xb      = %d su %d colonne\n', rank(Xb), n+1);
fprintf('kappa_2(X)        = %.3e\n', kX);
fprintf('kappa_2(X^T X)    = %.3e\n', kX^2);
fprintf('kappa(H_lambda)   = %.3e\n', kH);
fprintf('pesi w_i: min = %.3e, max = %.3e\n', min(w), max(w));
fprintf('||x_i||^2: media = %.1f, mediana = %.1f, max = %.1f\n', mean(norme2), median(norme2), max(norme2));
fprintf('kappa_SAGA (L max)   = %.3e   (kappa/m = %.1f) -> epoche ~ %.0f\n', kS, kS/m, epoche);
fprintf('kappa_SAGA (L medio) = %.3e   (kappa/m = %.1f) -> epoche ~ %.0f\n', kmed, kmed/m, epoche_med);
fprintf('epoche osservate  = 72\n');
