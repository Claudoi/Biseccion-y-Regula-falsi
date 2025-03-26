


%% Método Bisección

function [raiz, iteraciones] = biseccion(funcion, extremo_inferior, extremo_superior, error_deseado, iteraciones_maximas)
    
    % Comprobamos que se cumple el teorema de Bolzano

    if funcion(extremo_inferior) * funcion(extremo_superior) >= 0
        error('El intervalo no cumple el teorema de bolzano.');
    end
    
    
    % Validamos que el error deseado no sea demasiado pequeño

    if error_deseado < eps
        error('El error deseado es muy pequeño y podría tardar demasiado tiempo.');
    end
    
    iteraciones = 0; % Contador de iteraciones

    while (extremo_superior - extremo_inferior) / 2 > error_deseado && iteraciones < iteraciones_maximas
        punto_medio = (extremo_inferior + extremo_superior) / 2; % Calculamos el punto medio
        
        if funcion(punto_medio) == 0 % Si encontramos la raíz exacta
            break;
        
        elseif funcion(extremo_inferior) * funcion(punto_medio) < 0
            extremo_superior = punto_medio; % La raíz está en [extremo_inferior, punto_medio]
        
        else
            extremo_inferior = punto_medio; % La raíz está en [punto_medio, extremo_superior]
        
        end
        
        iteraciones = iteraciones + 1;
    
    end
    
    % Si se alcanza el número máximo de iteraciones, emitir advertencia

    if iteraciones >= iteraciones_maximas
        warning('Se alcanzó el número máximo de iteraciones. La raíz puede no ser precisa con el error deseado.');
    
    end
    
    raiz = (extremo_inferior + extremo_superior) / 2; % Aproximación de la raíz

end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Método Regula-Falsi

function [raiz, iteraciones] = regulaFalsi(funcion, extremo_inferior, extremo_superior, tolerancia, iteraciones_maximas)
    

    % Comprobamos que se cumple el teorema de Bolzano

    if funcion(extremo_inferior) * funcion(extremo_superior) >= 0
        error('El intervalo no cumple el teorema de Bolzano.');
    end
    

    iteraciones = 0; % Contador de iteraciones

    while abs(funcion(extremo_inferior) - funcion(extremo_superior)) > tolerancia && iteraciones < iteraciones_maximas
        

        % Calculamos el punto donde la recta intersecta el eje X

        punto_interseccion = extremo_superior - (funcion(extremo_superior) * (extremo_superior - extremo_inferior)) / (funcion(extremo_superior) - funcion(extremo_inferior));
        
        if funcion(punto_interseccion) == 0 % Si encontramos la raíz exacta
            
            break;
        
        elseif funcion(extremo_inferior) * funcion(punto_interseccion) < 0
            extremo_superior = punto_interseccion; % La raíz está en el intervalo [extremo_inferior, punto_interseccion]
        
        else
            extremo_inferior = punto_interseccion; % La raíz está en el intervalo [punto_interseccion, extremo_superior]
        
        end

        iteraciones = iteraciones + 1;

    end

    raiz = extremo_superior - (funcion(extremo_superior) * (extremo_superior - extremo_inferior)) / (funcion(extremo_superior) - funcion(extremo_inferior));

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Comparación de ambos métodos

% Definimos la función del apartado

funcion = @(x) exp(0.75 * x) - 3 * sin(1.25 * x);


% Intervalo inicial

extremo_inferior = 0;
extremo_superior = 1.2;


% Parámetros de tolerancia y máximas iteraciones

tolerancia = 1e-6;
iteraciones_maximas = 100;


% Validamos que la tolerancia no sea muy pequeña

if tolerancia < eps
    error('El valor de la tolerancia es muy pequeño y podría tardar demasiado tiempo.');
end


% Llamamos a los métodos

[raiz_biseccion, iteraciones_biseccion] = biseccion(funcion, extremo_inferior, extremo_superior, tolerancia, iteraciones_maximas);

[raiz_regula_falsi, iteraciones_regula_falsi] = regulaFalsi(funcion, extremo_inferior, extremo_superior, tolerancia, iteraciones_maximas);


% Mostramos los resultados

fprintf('Método de Bisección:\n')

fprintf('Raíz aproximada: %.6f\n', raiz_biseccion)

fprintf('Número de iteraciones: %d\n\n', iteraciones_biseccion)

fprintf('Método de Regula-Falsi:\n')

fprintf('Raíz aproximada: %.6f\n', raiz_regula_falsi)

fprintf('Número de iteraciones: %d\n', iteraciones_regula_falsi)



