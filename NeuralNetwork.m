% Victor Augusto Kich

w = [0.11; 0.21; 0.12; 0.08; 0.14; 0.15];
learning_rate = 0.05;
hidden_layers = 2;
tolerance = 0.001;
%inputs_size = 2;
inputs = randi(2,10);
output_fixa = 1;
hidden = zeros(hidden_layers,1);

error = 0.01;
while error > tolerance
    error = 0;
    counter = 0;
    h1 = 0;
    h2 = 0;
    x1 = 0;
    x2 = 0;
    
    while counter < 10
        counter = counter + 1;

        hidden(1,1) = inputs(counter,1)*w(1,1) + inputs(counter,2)*w(2,1);
        hidden(2,1) = inputs(counter,1)*w(3,1) + inputs(counter,2)*w(4,1);

        hidden
        output = hidden(1,1)*w(5,1) + hidden(2,1)*w(6,1);
        output

        error = 0.5*(output - output_fixa)^2 + error;
        error
        h1 = hidden(1,1) + h1;
        h2 = hidden(2,1) + h2;
        x1 = inputs(counter,1) + x1;
        x2 = inputs(counter,2) + x2;
    end
    delta = output - output_fixa;
    new_w = zeros(hidden_layers,1);
    new_w(6,1) = w(6,1) - learning_rate*(h2*delta);
    new_w(5,1) = w(5,1) - learning_rate*(h1*delta);
    new_w(4,1) = w(4,1) - learning_rate*(x2*delta*w(6,1));
    new_w(3,1) = w(3,1) - learning_rate*(x1*delta*w(6,1));
    new_w(2,1) = w(2,1) - learning_rate*(x2*delta*w(5,1));
    new_w(1,1) = w(1,1) - learning_rate*(x1*delta*w(5,1));
    new_w
    w = new_w;
end
