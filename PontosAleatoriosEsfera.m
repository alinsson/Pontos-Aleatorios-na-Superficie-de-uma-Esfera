%Implementado por Alinsson Figueira de Souza
%Graduando em Engenharia da Computação - UFC
clc;
clear all;
raio=input('Digite o raio da esfera: ');
n=input('Digite a quantidade de pontos(MAX = 2.147.483.647): ');
for i=1:n
    ro=raio;
    teta=2*pi*rand(1);
    fi=pi*rand(1);
    x(i)=ro*sin(fi)*cos(teta);
    y(i)=ro*sin(fi)*sin(teta);
    z(i)=ro*cos(fi);
end
hold on
for i=1:n
    plot3(x(i),y(i),z(i),'r');
end
xlabel('x');
ylabel('y');
zlabel('z');
title('Pontos Aleatórios Gerados na Superfície de uma Esfera');
print -djpeg pontosesfera
hold off
xtotal=0;
ytotal=0;
ztotal=0;
for i=1:n
    xtotal=xtotal+x(i);
    ytotal=ytotal+y(i);
    ztotal=ztotal+z(i);
end
fprintf('\nMédia do x: %d\n',(xtotal/n));
fprintf('Média do y: %d\n',(ytotal/n));
fprintf('Média do z: %d\n',(ztotal/n));
fprintf('\nDeseja plotar os vetores posição(cetro = (0,0,0))?\n(1) - Sim\n(2) - Não\n');
resp=input('');
if resp==1
    hold on
    for i=1:n
        quiver3(0,0,0,x(i),y(i),z(i));
    end
    xlabel('x');
    ylabel('y');
    zlabel('z');
    title('Vetores Posição dos Pontos Aleatórios Gerados na Superfície de uma Esfera');
    print -djpeg vetorespontos
    hold off
end
fprintf('\nDeseja plotar os gráficos de x vs ponto, y vs ponto, z vs ponto?\n(1) - Sim\n(2) - Não\n');
resp=input('');
if resp==1
    subplot(1,3,1);
    barh(x);
    xlabel('x');
    ylabel('ponto');
    title('Análise de x');
    subplot(1,3,2);
    barh(y);
    xlabel('y');
    ylabel('ponto');
    title('Análise de y');
    subplot(1,3,3);
    barh(z);
    xlabel('z');
    ylabel('ponto');
    title('Análise de z');
    print -djpeg analisesxyz
end