function[puzzle,var] = Sudoku(puzzle,var)
count = 0;
while sum(sum(puzzle(:,:))) ~= 405 && count <= 100
    disp(puzzle)
    line = zeros(1,81);
    for i = 1:81
        line(i) = puzzle(floor((i-1)/9)+1,mod(i-1,9)+1);
    end
    for i = 1:81
        if line(i) == 0 && sum(var(:,i)) == 0
            for j = 1:9
                var(j,i) = j;
            end
        elseif sum(var(:,i)) == 0
            var(line(i),i) = line(i);
        end
    end
    for i = 1:81
        if line(i) ~= 0
            x = floor((i-1)/9)+1;
            y = mod(i-1,9)+1;
            for j = 9*x-8:9*x
                for k = 1:9
                    if j ~= i
                        if var(k,j) == var(k,i)
                            var(k,j) = 0;
                        end
                    end
                end
            end
            for j = y:9:y+72
                for k = 1:9
                    if j ~= i
                        if var(k,j) == var(k,i)
                            var(k,j) = 0;
                        end
                    end
                end
            end
            if x < 4
                if y < 4
                    for j = 1:81
                        a = floor((j-1)/9)+1;
                        b = mod(j-1,9)+1;
                        if a < 4 && b < 4
                            if j ~= i
                                for k = 1:9
                                    if var(k,j) == var(k,i)
                                        var(k,j) = 0;
                                    end
                                end
                            end
                        end
                    end
                elseif y < 7
                    for j = 1:81
                        a = floor((j-1)/9)+1;
                        b = mod(j-1,9)+1;
                        if a < 4 && b > 3 && b < 7
                            if j ~= i
                                for k = 1:9
                                    if var(k,j) == var(k,i)
                                        var(k,j) = 0;
                                    end
                                end
                            end
                        end
                    end
                else
                    for j = 1:81
                        a = floor((j-1)/9)+1;
                        b = mod(j-1,9)+1;
                        if a < 4 && b > 6
                            if j ~= i
                                for k = 1:9
                                    if var(k,j) == var(k,i)
                                        var(k,j) = 0;
                                    end
                                end
                            end
                        end
                    end
                end
            elseif x < 7
                if y < 4
                    for j = 1:81
                        a = floor((j-1)/9)+1;
                        b = mod(j-1,9)+1;
                        if a > 3 && a < 7 && b < 4
                            if j ~= i
                                for k = 1:9
                                    if var(k,j) == var(k,i)
                                        var(k,j) = 0;
                                    end
                                end
                            end
                        end
                    end
                elseif y < 7
                    for j = 1:81
                        a = floor((j-1)/9)+1;
                        b = mod(j-1,9)+1;
                        if a > 3 && a < 7 && b < 7 && b > 3
                            if j ~= i
                                for k = 1:9
                                    if var(k,j) == var(k,i)
                                        var(k,j) = 0;
                                    end
                                end
                            end
                        end
                    end
                else
                    for j = 1:81
                        a = floor((j-1)/9)+1;
                        b = mod(j-1,9)+1;
                        if a > 3 && a < 7 && b > 6
                            if j ~= i
                                for k = 1:9
                                    if var(k,j) == var(k,i)
                                        var(k,j) = 0;
                                    end
                                end
                            end
                        end
                    end
                end
            else
                if y < 4
                    for j = 1:81
                        a = floor((j-1)/9)+1;
                        b = mod(j-1,9)+1;
                        if a > 6 && b < 4
                            if j ~= i
                                for k = 1:9
                                    if var(k,j) == var(k,i)
                                        var(k,j) = 0;
                                    end
                                end
                            end
                        end
                    end
                elseif y < 7
                    for j = 1:81
                        a = floor((j-1)/9)+1;
                        b = mod(j-1,9)+1;
                        if a > 6 && b > 3 && b < 7
                            if j ~= i
                                for k = 1:9
                                    if var(k,j) == var(k,i)
                                        var(k,j) = 0;
                                    end
                                end
                            end
                        end
                    end
                else
                    for j = 1:81
                        a = floor((j-1)/9)+1;
                        b = mod(j-1,9)+1;
                        if a > 6 && b > 6
                            if j ~= i
                                for k = 1:9
                                    if var(k,j) == var(k,i)
                                        var(k,j) = 0;
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    for i = 1:81
        k = 0;
        for j = 1:9
            if var(j,i) ~= 0
                k = k+1;
            end
        end
        if k == 1
            line(i) = sum(var(:,i));
            puzzle(floor((i-1)/9)+1,mod(i-1,9)+1) = line(i);
        end
    end
    for i = 1:81
        k = 0;
        for j = 1:9
            if var(j,i) ~= 0
                k = k+1;
            end
        end
        if k == 2
            x = floor((i-1)/9)+1;
            y = mod(i-1,9)+1;
            for j = 9*x-8:9*x
                if i ~= j
                    if var(:,j) == var(:,i)
                        for w = 9*x-8:9*x
                            if w ~= i && w ~= j
                                for v = 1:9
                                    if var(v,w) == var(v,i)
                                        var(v,w) = 0;
                                    end
                                end
                            end
                        end
                    end
                end
            end
            for j = y:9:y+72
                if i ~= j
                    if var(:,j) == var(:,i)
                        for w = y:9:y+72
                            if w ~= i && w ~= j
                                for v = 1:9
                                    if var(v,w) == var(v,i)
                                        var(v,w) = 0;
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if x < 4
                if y < 4
                    for j = 1:81
                        if i ~= j
                            a = floor((j-1)/9)+1;
                            b = mod(j-1,9)+1;
                            if var(:,i) == var(:,j)
                                if a < 4 && b < 4
                                    for w = 1:81
                                        c = floor((w-1)/9)+1;
                                        d = mod(w-1,9)+1;
                                        if w ~= i && w~= j
                                            if c < 4 && d < 4
                                                for v = 1:9
                                                    if var(v,w) == var(v,i)
                                                        var(v,w) = 0;
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                elseif y < 7
                    for j = 1:81
                        if i ~= j
                            a = floor((j-1)/9)+1;
                            b = mod(j-1,9)+1;
                            if var(:,i) == var(:,j)
                                if a < 4 && b < 7 && b > 3
                                    for w = 1:81
                                        c = floor((w-1)/9)+1;
                                        d = mod(w-1,9)+1;
                                        if w ~= i && w~= j
                                            if c < 4 && d < 7 && d > 3
                                                for v = 1:9
                                                    if var(v,w) == var(v,i)
                                                        var(v,w) = 0;
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                else
                    for j = 1:81
                        if i ~= j
                            a = floor((j-1)/9)+1;
                            b = mod(j-1,9)+1;
                            if var(:,i) == var(:,j)
                                if a < 4 && b > 6
                                    for w = 1:81
                                        c = floor((w-1)/9)+1;
                                        d = mod(w-1,9)+1;
                                        if w ~= i && w~= j
                                            if c < 4 && d > 6
                                                for v = 1:9
                                                    if var(v,w) == var(v,i)
                                                        var(v,w) = 0;
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            elseif x < 7
                if y < 4
                    for j = 1:81
                        if i ~= j
                            a = floor((j-1)/9)+1;
                            b = mod(j-1,9)+1;
                            if var(:,i) == var(:,j)
                                if a < 7 && a > 3 && b < 4
                                    for w = 1:81
                                        c = floor((w-1)/9)+1;
                                        d = mod(w-1,9)+1;
                                        if w ~= i && w~= j
                                            if c < 7 && c > 3 && d < 4
                                                for v = 1:9
                                                    if var(v,w) == var(v,i)
                                                        var(v,w) = 0;
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                elseif y < 7
                    for j = 1:81
                        if i ~= j
                            a = floor((j-1)/9)+1;
                            b = mod(j-1,9)+1;
                            if var(:,i) == var(:,j)
                                if a < 7 && a > 3 && b < 7 && b > 3
                                    for w = 1:81
                                        c = floor((w-1)/9)+1;
                                        d = mod(w-1,9)+1;
                                        if w ~= i && w~= j
                                            if c < 7 && c > 3 && d < 7 && d > 3
                                                for v = 1:9
                                                    if var(v,w) == var(v,i)
                                                        var(v,w) = 0;
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                else
                    for j = 1:81
                        if i ~= j
                            a = floor((j-1)/9)+1;
                            b = mod(j-1,9)+1;
                            if var(:,i) == var(:,j)
                                if a < 7 && a > 3 && b > 6
                                    for w = 1:81
                                        c = floor((w-1)/9)+1;
                                        d = mod(w-1,9)+1;
                                        if w ~= i && w~= j
                                            if c < 7 && c > 3 && d > 6
                                                for v = 1:9
                                                    if var(v,w) == var(v,i)
                                                        var(v,w) = 0;
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            else
                if y < 4
                    for j = 1:81
                        if i ~= j
                            a = floor((j-1)/9)+1;
                            b = mod(j-1,9)+1;
                            if var(:,i) == var(:,j)
                                if a > 6 && b < 4
                                    for w = 1:81
                                        c = floor((w-1)/9)+1;
                                        d = mod(w-1,9)+1;
                                        if w ~= i && w~= j
                                            if c > 6 && d < 4
                                                for v = 1:9
                                                    if var(v,w) == var(v,i)
                                                        var(v,w) = 0;
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                elseif y < 7
                    for j = 1:81
                        if i ~= j
                            a = floor((j-1)/9)+1;
                            b = mod(j-1,9)+1;
                            if var(:,i) == var(:,j)
                                if a > 6 && b < 7 && b > 3
                                    for w = 1:81
                                        c = floor((w-1)/9)+1;
                                        d = mod(w-1,9)+1;
                                        if w ~= i && w~= j
                                            if c > 6 && d < 7 && d > 3
                                                for v = 1:9
                                                    if var(v,w) == var(v,i)
                                                        var(v,w) = 0;
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                else
                    for j = 1:81
                        if i ~= j
                            a = floor((j-1)/9)+1;
                            b = mod(j-1,9)+1;
                            if var(:,i) == var(:,j)
                                if a > 6 && b > 6
                                    for w = 1:81
                                        c = floor((w-1)/9)+1;
                                        d = mod(w-1,9)+1;
                                        if w ~= i && w~= j
                                            if c > 6 && d > 6
                                                for v = 1:9
                                                    if var(v,w) == var(v,i)
                                                        var(v,w) = 0;
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    for i = 1:9
        h = zeros(9,1);
        for j = 1:9
            if sum(var(j,9*i-8:9*i)) == 2*j
                h(j) = j;
            end
        end
        g = zeros(9,2);
        for j = 1:9
            f = 1;
            for k = 9*i-8:9*i
                if h(j) ~= 0
                    if var(j,k) == h(j) && var(j,k) ~= 0
                        g(j,f) = k;
                        f = f + 1;
                    end
                end
            end
        end
        for j = 1:9
            if sum(g(j,:)) ~= 0
                for k = 1:9
                    if sum(g(k,:)) ~= 0 && k ~= j
                        f = zeros(9,1);
                        if g(j,1) == g(k,1) && g(j,2) == g(k,2)
                            f(j) = j;
                            f(k) = k;
                            var(:,g(j,1)) = f;
                            var(:,g(j,2)) = f;
                        end
                    end
                end
            end
        end
    end
    for i = 1:9
        h = zeros(9,1);
        for j = 1:9
            if sum(var(j,i:9:72+i)) == 2*j
                h(j) = j;
            end
        end
        g = zeros(9,2);
        for j = 1:9
            f = 1;
            for k = i:9:72+i
                if h(j) ~= 0
                    if var(j,k) == h(j) && var(j,k) ~= 0
                        g(j,f) = k;
                        f = f + 1;
                    end
                end
            end
        end
        for j = 1:9
            if sum(g(j,:)) ~= 0
                for k = 1:9
                    if sum(g(k,:)) ~= 0 && k ~= j
                        f = zeros(9,1);
                        if g(j,1) == g(k,1) && g(j,2) == g(k,2)
                            f(j) = j;
                            f(k) = k;
                            var(:,g(j,1)) = f;
                            var(:,g(j,2)) = f;
                        end
                    end
                end
            end
        end
    end
    for i = 1:81
        k = 0;
        for j = 1:9
            if var(j,i) ~= 0
                k = k+1;
            end
        end
        if k == 1
            line(i) = sum(var(:,i));
            puzzle(floor((i-1)/9)+1,mod(i-1,9)+1) = line(i);
        end
    end
    for i = 1:9
        for j = 9*i-8:9*i
            for k = 1:9
                if var(k,j) == sum(var(k,9*i-8:9*i))
                    for l = 1:9
                        if l ~= k
                            var(l,j) = 0;
                        end
                    end
                end
            end
        end
        for j = i:9:i+72
            for k = 1:9
                if var(k,j) == sum(var(k,i:9:i+72))
                    for l = 1:9
                        if l ~= k
                            var(l,j) = 0;
                        end
                    end
                end    
            end
        end
    end
    for i = 1:81
        x = floor((i-1)/9)+1;
        y = mod(i-1,9)+1;
        if x < 4
            if y < 4
                for j = 1:9
                    a = 0;
                    for k = [1,2,3,10,11,12,19,20,21]
                        a = a + var(j,k);
                    end
                    if var(j,i) == a
                        for l = 1:9
                            if l ~= j
                                var(l,i) = 0;
                            end
                        end
                    end
                end
            elseif y < 7
                for j = 1:9
                    a = 0;
                    for k = [1,2,3,10,11,12,19,20,21]
                        a = a + var(j,k+3);
                    end
                    if var(j,i) == a
                        for l = 1:9
                            if l ~= j
                                var(l,i) = 0;
                            end
                        end
                    end
                end
            else
                for j = 1:9
                    a = 0;
                    for k = [1,2,3,10,11,12,19,20,21]
                        a = a + var(j,k+6);
                    end
                    if var(j,i) == a
                        for l = 1:9
                            if l ~= j
                                var(l,i) = 0;
                            end
                        end
                    end
                end
            end
        elseif x < 7
            if y < 4
                for j = 1:9
                    a = 0;
                    for k = [1,2,3,10,11,12,19,20,21]
                        a = a + var(j,k+27);
                    end
                    if var(j,i) == a
                        for l = 1:9
                            if l ~= j
                                var(l,i) = 0;
                            end
                        end
                    end
                end
            elseif y < 7
                for j = 1:9
                    a = 0;
                    for k = [1,2,3,10,11,12,19,20,21]
                        a = a + var(j,k+30);
                    end
                    if var(j,i) == a
                        for l = 1:9
                            if l ~= j
                                var(l,i) = 0;
                            end
                        end
                    end
                end
            else
                for j = 1:9
                    a = 0;
                    for k = [1,2,3,10,11,12,19,20,21]
                        a = a + var(j,k+33);
                    end
                    if var(j,i) == a
                        for l = 1:9
                            if l ~= j
                                var(l,i) = 0;
                            end
                        end
                    end
                end
            end
        else
            if y < 4
                for j = 1:9
                    a = 0;
                    for k = [1,2,3,10,11,12,19,20,21]
                        a = a + var(j,k+54);
                    end
                    if var(j,i) == a
                        for l = 1:9
                            if l ~= j
                                var(l,i) = 0;
                            end
                        end
                    end
                end
            elseif y < 7
                for j = 1:9
                    a = 0;
                    for k = [1,2,3,10,11,12,19,20,21]
                        a = a + var(j,k+57);
                    end
                    if var(j,i) == a
                        for l = 1:9
                            if l ~= j
                                var(l,i) = 0;
                            end
                        end
                    end
                end
            else
                for j = 1:9
                    a = 0;
                    for k = [1,2,3,10,11,12,19,20,21]
                        a = a + var(j,k+60);
                    end
                    if var(j,i) == a
                        for l = 1:9
                            if l ~= j
                                var(l,i) = 0;
                            end
                        end
                    end
                end
            end
        end
    end
    for i = 1:9
        for j = 1:3
            if sum(var(i,27*j-26:27*j-24)) ~= 0 && sum(var(i,27*j-17:27*j-15)) == 0 && sum(var(i,27*j-8:27*j-6)) == 0
                for k = 1:6
                    var(i,27*j-24+k) = 0;
                end
            end
            if sum(var(i,27*j-26:27*j-24)) == 0 && sum(var(i,27*j-17:27*j-15)) ~= 0 && sum(var(i,27*j-8:27*j-6)) == 0
                for k = 1:6
                    var(i,27*j-15+k) = 0;
                end
            end
            if sum(var(i,27*j-26:27*j-24)) == 0 && sum(var(i,27*j-17:27*j-15)) == 0 && sum(var(i,27*j-8:27*j-6)) ~= 0
                for k = 1:6
                    var(i,27*j-6+k) = 0;
                end
            end
            if sum(var(i,27*j-23:27*j-21)) ~= 0 && sum(var(i,27*j-14:27*j-12)) == 0 && sum(var(i,27*j-5:27*j-3)) == 0
                for k = 1:3
                    var(i,27*j-27+k) = 0;
                    var(i,27*j-21+k) = 0;
                end
            end
            if sum(var(i,27*j-23:27*j-21)) == 0 && sum(var(i,27*j-14:27*j-12)) ~= 0 && sum(var(i,27*j-5:27*j-3)) == 0
                for k = 1:3
                    var(i,27*j-18+k) = 0;
                    var(i,27*j-12+k) = 0;
                end
            end
            if sum(var(i,27*j-23:27*j-21)) == 0 && sum(var(i,27*j-14:27*j-12)) == 0 && sum(var(i,27*j-5:27*j-3)) ~= 0
                for k = 1:3
                    var(i,27*j-9+k) = 0;
                    var(i,27*j-3+k) = 0;
                end
            end
            if sum(var(i,27*j-20:27*j-18)) ~= 0 && sum(var(i,27*j-11:27*j-9)) == 0 && sum(var(i,27*j-2:27*j)) == 0
                for k = 1:6
                    var(i,27*j-27+k) = 0;
                end
            end
            if sum(var(i,27*j-20:27*j-18)) == 0 && sum(var(i,27*j-11:27*j-9)) ~= 0 && sum(var(i,27*j-2:27*j)) == 0
                for k = 1:6
                    var(i,27*j-18+k) = 0;
                end
            end
            if sum(var(i,27*j-20:27*j-18)) == 0 && sum(var(i,27*j-11:27*j-9)) == 0 && sum(var(i,27*j-2:27*j)) ~= 0
                for k = 1:6
                    var(i,27*j-9+k) = 0;
                end
            end
            if sum(var(i,(3*j-2):9:(18+3*j-2))) ~= 0 && sum(var(i,(3*j-1):9:(18+3*j-1))) == 0 && sum(var(i,(3*j):9:(18+3*j))) == 0
                for k = 1:6
                    var(i,16+3*j+9*k) = 0;
                end
            end
            if sum(var(i,(3*j-2):9:(18+3*j-2))) == 0 && sum(var(i,(3*j-1):9:(18+3*j-1))) ~= 0 && sum(var(i,(3*j):9:(18+3*j))) == 0
                for k = 1:6
                    var(i,17+3*j+9*k) = 0;
                end
            end
            if sum(var(i,(3*j-2):9:(18+3*j-2))) == 0 && sum(var(i,(3*j-1):9:(18+3*j-1))) == 0 && sum(var(i,(3*j):9:(18+3*j))) ~= 0
                for k = 1:6
                    var(i,18+3*j+9*k) = 0;
                end
            end
            if sum(var(i,(3*j+25):9:(18+3*j-2))) ~= 0 && sum(var(i,(3*j+26):9:(18+3*j-1))) == 0 && sum(var(i,(3*j+27):9:(18+3*j))) == 0
                for k = 1:3
                    var(i,-9+3*j+9*k) = 0;
                    var(i,45+3*j+9*k) = 0;
                end
            end
            if sum(var(i,(3*j+25):9:(18+3*j-2))) == 0 && sum(var(i,(3*j+26):9:(18+3*j-1))) ~= 0 && sum(var(i,(3*j+27):9:(18+3*j))) == 0
                for k = 1:3
                    var(i,-8+3*j+9*k) = 0;
                    var(i,46+3*j+9*k) = 0;
                end
            end
            if sum(var(i,(3*j+25):9:(18+3*j-2))) == 0 && sum(var(i,(3*j+26):9:(18+3*j-1))) == 0 && sum(var(i,(3*j+27):9:(18+3*j))) ~= 0
                for k = 1:3
                    var(i,-7+3*j+9*k) = 0;
                    var(i,47+3*j+9*k) = 0;
                end
            end
            if sum(var(i,(3*j+52):9:(18+3*j+52))) ~= 0 && sum(var(i,(3*j+53):9:(18+3*j+53))) == 0 && sum(var(i,(3*j+54):9:(18+3*j+54))) == 0
                for k = 1:6
                    var(i,-11+3*j+9*k) = 0;
                end
            end
            if sum(var(i,(3*j+52):9:(18+3*j+52))) == 0 && sum(var(i,(3*j+53):9:(18+3*j+53))) ~= 0 && sum(var(i,(3*j+54):9:(18+3*j+54))) == 0
                for k = 1:6
                    var(i,-10+3*j+9*k) = 0;
                end
            end
            if sum(var(i,(3*j+52):9:(18+3*j+52))) == 0 && sum(var(i,(3*j+53):9:(18+3*j+53))) == 0 && sum(var(i,(3*j+54):9:(18+3*j+54))) ~= 0
                for k = 1:6
                    var(i,-9+3*j+9*k) = 0;
                end
            end
            
            if sum(var(i,-11+3*j+9*[1:3])) ~= 0 && sum(var(i,-11+3*j+9*[4:6])) == 0 && sum(var(i,-11+3*j+9*[7:9])) == 0
                for k = 1:3
                    var(i,-10+3*j+9*[1:3]) = 0;
                    var(i,-9+3*j+9*[1:3]) = 0;
                end
            end
            if sum(var(i,-10+3*j+9*[1:3])) ~= 0 && sum(var(i,-10+3*j+9*[4:6])) == 0 && sum(var(i,-10+3*j+9*[7:9])) == 0
                for k = 1:3
                    var(i,-11+3*j+9*[1:3]) = 0;
                    var(i,-9+3*j+9*[1:3]) = 0;
                end
            end
            if sum(var(i,-9+3*j+9*[1:3])) ~= 0 && sum(var(i,-9+3*j+9*[4:6])) == 0 && sum(var(i,-9+3*j+9*[7:9])) == 0
                for k = 1:3
                    var(i,-11+3*j+9*[1:3]) = 0;
                    var(i,-10+3*j+9*[1:3]) = 0;
                end
            end
            if sum(var(i,-11+3*j+9*[1:3])) == 0 && sum(var(i,-11+3*j+9*[4:6])) ~= 0 && sum(var(i,-11+3*j+9*[7:9])) == 0
                for k = 1:3
                    var(i,-10+3*j+9*[4:6]) = 0;
                    var(i,-9+3*j+9*[4:6]) = 0;
                end
            end
            if sum(var(i,-10+3*j+9*[1:3])) == 0 && sum(var(i,-10+3*j+9*[4:6])) ~= 0 && sum(var(i,-10+3*j+9*[7:9])) == 0
                for k = 1:3
                    var(i,-11+3*j+9*[4:6]) = 0;
                    var(i,-9+3*j+9*[4:6]) = 0;
                end
            end
            if sum(var(i,-9+3*j+9*[1:3])) == 0 && sum(var(i,-9+3*j+9*[4:6])) ~= 0 && sum(var(i,-9+3*j+9*[7:9])) == 0
                for k = 1:3
                    var(i,-11+3*j+9*[4:6]) = 0;
                    var(i,-10+3*j+9*[4:6]) = 0;
                end
            end
            if sum(var(i,-11+3*j+9*[1:3])) == 0 && sum(var(i,-11+3*j+9*[4:6])) == 0 && sum(var(i,-11+3*j+9*[7:9])) ~= 0
                for k = 1:3
                    var(i,-10+3*j+9*[7:9]) = 0;
                    var(i,-9+3*j+9*[7:9]) = 0;
                end
            end
            if sum(var(i,-10+3*j+9*[1:3])) == 0 && sum(var(i,-10+3*j+9*[4:6])) == 0 && sum(var(i,-10+3*j+9*[7:9])) ~= 0
                for k = 1:3
                    var(i,-11+3*j+9*[7:9]) = 0;
                    var(i,-9+3*j+9*[7:9]) = 0;
                end
            end
            if sum(var(i,-9+3*j+9*[1:3])) == 0 && sum(var(i,-9+3*j+9*[4:6])) == 0 && sum(var(i,-9+3*j+9*[7:9])) ~= 0
                for k = 1:3
                    var(i,-11+3*j+9*[7:9]) = 0;
                    var(i,-10+3*j+9*[7:9]) = 0;
                end
            end
        end
    end
    for i = 1:9
        for j = 1:9
            a = find(var(i,j:9:72+j)==i);
            for k = 1:9
                b = find(var(i,k:9:72+k)==i);
                if length(a) == 2 && length(b) == 2 && j~=k
                    if a==b
                        for l = 1:9
                            if l ~= j && l ~= k
                                var(i,a*9-9+l) = 0;
                            end
                        end
                    end
                end
            end
        end
    end
    for i = 1:9
        for j = 1:9
            a = find(var(i,9*j-8:9*j)==i);
            for k = 1:9
                b = find(var(i,9*k-8:9*k)==i);
                if length(a) == 2 && length(b) == 2 && j~=k
                    if a==b
                        for l = 1:9
                            if l ~= j && l ~= k
                                var(i,l*9-9+a) = 0;
                            end
                        end
                    end
                end
            end
        end
    end
    for i = 1:9
        for j = 1:9
            a = find(var(i,j:9:72+j)==i);
            for k = 1:9
                b = find(var(i,k:9:72+k)==i);
                for l = 1:9
                    c = find(var(i,l:9:72+l)==i);
                    if length(a) == 2 && length(b) == 2 && length(c) == 2 && j~=k && j~=l && k~=l
                        if a(1)==c(1) && a(2) == b(1) && b(2) == c(2)
                            for m = 1:9
                                if m ~= j && m ~= k && m ~= l
                                    var(i,a*9-9+m) = 0;
                                    var(i,b*9-9+m) = 0;
                                end
                            end
                        end
                    end
                    if length(a) == 3 && length(b) == 2 && length(c) == 2 && j~=k && j~=l && k~=l
                        if a(1)==c(1) && a(2) == b(1) && a(3) == c(2) && b(2) == c(2)
                            for m = 1:9
                                if m ~= j && m ~= k && m ~= l
                                    var(i,a*9-9+m) = 0;
                                end
                            end
                        end
                    end
                    if length(a) == 2 && length(b) == 3 && length(c) == 2 && j~=k && j~=l && k~=l
                        if a(1) == b(1) && a(1)==c(1) && a(2) == b(2) && b(3) == c(2)
                            for m = 1:9
                                if m ~= j && m ~= k && m ~= l
                                    var(i,b*9-9+m) = 0;
                                end
                            end
                        end
                    end
                    if length(a) == 3 && length(b) == 3 && length(c) == 2 && j~=k && j~=l && k~=l
                        if a(1) == b(1) && a(1)==c(1) && a(2) == b(2) && a(3) == c(2) && b(3) == c(2)
                            for m = 1:9
                                if m ~= j && m ~= k && m ~= l
                                    var(i,a*9-9+m) = 0;
                                end
                            end
                        end
                    end
                    if length(a) == 2 && length(b) == 2 && length(c) == 3 && j~=k && j~=l && k~=l
                        if a(1)==c(1) && a(2) == b(1) && a(2) == c(2) && b(2) == c(3)
                            for m = 1:9
                                if m ~= j && m ~= k && m ~= l
                                    var(i,c*9-9+m) = 0;
                                end
                            end
                        end
                    end
                    if length(a) == 3 && length(b) == 2 && length(c) == 3 && j~=k && j~=l && k~=l
                        if a(1)==c(1) && a(2) == b(1) && a(2) == c(2) && a(3) == c(3) && b(2) == c(3)
                            for m = 1:9
                                if m ~= j && m ~= k && m ~= l
                                    var(i,a*9-9+m) = 0;
                                end
                            end
                        end
                    end
                    if length(a) == 2 && length(b) == 3 && length(c) == 3 && j~=k && j~=l && k~=l
                        if a(1) == b(1) && a(1)==c(1) && a(2) == b(2) && a(2) == c(2) && b(3) == c(3)
                            for m = 1:9
                                if m ~= j && m ~= k && m ~= l
                                    var(i,b*9-9+m) = 0;
                                end
                            end
                        end
                    end
                    if length(a) == 3 && length(b) == 3 && length(c) == 3 && j~=k && j~=l && k~=l
                        if a == b
                            if b == c
                                for m = 1:9
                                    if m ~= j && m ~= k && m ~= l
                                        var(i,a*9-9+m) = 0;
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end%%%
    for i = 1:9
        for j = 1:9
            for k = 1:9
                for l = 1:9
                    if i~=j && k~=l
                        a = var(:,i-9+9*k);
                        b = var(:,i-9+9*l);
                        c = var(:,j-9+9*k);
                        if length(nonzeros(a)) == length(nonzeros(b)) && length(nonzeros(b)) == length(nonzeros(c)) && length(nonzeros(c)) == 2 && length(nonzeros((a-b-c))) == 1
                            var(nonzeros(-(a-b-c)/2),j-9+9*l) = 0;
                            for m = 1:81
                                if floor((m-1)/9)+1 == l && mod(m-1,9)+1 ~= i
                                    if k < 4
                                        if j < 4
                                            if floor((m-1)/9)+1 < 4 && mod(m-1,9)+1 < 4
                                                var(nonzeros(-(a-b-c)/2),m) = 0;
                                            end
                                        elseif j < 7
                                            if floor((m-1)/9)+1 < 4 && mod(m-1,9)+1 > 3 && mod(m-1,9)+1 < 7
                                                var(nonzeros(-(a-b-c)/2),m) = 0;
                                            end
                                        else
                                            if floor((m-1)/9)+1 < 4 && mod(m-1,9)+1 > 6
                                                var(nonzeros(-(a-b-c)/2),m) = 0;
                                            end
                                        end
                                    elseif k < 7
                                        if j < 4
                                            if floor((m-1)/9)+1 < 7 && floor((m-1)/9)+1 > 3 && mod(m-1,9)+1 < 4
                                                var(nonzeros(-(a-b-c)/2),m) = 0;
                                            end
                                        elseif j < 7
                                            if floor((m-1)/9)+1 < 7 && floor((m-1)/9)+1 > 3 && mod(m-1,9)+1 < 7 && mod(m-1,9)+1 > 3
                                                var(nonzeros(-(a-b-c)/2),m) = 0;
                                            end
                                        else
                                            if floor((m-1)/9)+1 < 7 && floor((m-1)/9)+1 > 3 && mod(m-1,9)+1 > 6
                                                var(nonzeros(-(a-b-c)/2),m) = 0;
                                            end
                                        end
                                    else
                                        if j < 4
                                            if floor((m-1)/9)+1 > 6 && mod(m-1,9)+1 > 3
                                                var(nonzeros(-(a-b-c)/2),m) = 0;
                                            end
                                        elseif j < 7
                                            if floor((m-1)/9)+1 > 6 && mod(m-1,9)+1 > 6
                                                var(nonzeros(-(a-b-c)/2),m) = 0;
                                            end
                                        else
                                            if floor((m-1)/9)+1 > 6 && mod(m-1,9)+1 > 6
                                                var(nonzeros(-(a-b-c)/2),m) = 0;
                                            end
                                        end
                                    end
                                end
                                if mod(m-1,9)+1 == j && floor((m-1)/9)+1 ~= k
                                    if l < 4
                                        if i < 4
                                            if floor((m-1)/9)+1 < 4 && mod(m-1,9)+1 < 4
                                                var(nonzeros(-(a-b-c)/2),m) = 0;
                                            end
                                        elseif i < 7
                                            if floor((m-1)/9)+1 < 4 && mod(m-1,9)+1 > 3 && mod(m-1,9)+1 < 7
                                                var(nonzeros(-(a-b-c)/2),m) = 0;
                                            end
                                        else
                                            if floor((m-1)/9)+1 < 4 && mod(m-1,9)+1 > 6
                                                var(nonzeros(-(a-b-c)/2),m) = 0;
                                            end
                                        end
                                 elseif l < 7
                                        if i < 4
                                            if floor((m-1)/9)+1 < 7 && floor((m-1)/9)+1 > 3 && mod(m-1,9)+1 < 4
                                                var(nonzeros(-(a-b-c)/2),m) = 0;
                                            end
                                        elseif i < 7
                                            if floor((m-1)/9)+1 < 7 && floor((m-1)/9)+1 > 3 && mod(m-1,9)+1 < 7 && mod(m-1,9)+1 > 3
                                                var(nonzeros(-(a-b-c)/2),m) = 0;
                                            end
                                        else
                                            if floor((m-1)/9)+1 < 7 && floor((m-1)/9)+1 > 3 && mod(m-1,9)+1 > 6
                                                var(nonzeros(-(a-b-c)/2),m) = 0;
                                            end
                                        end
                                    else
                                        if i < 4
                                            if floor((m-1)/9)+1 > 6 && mod(m-1,9)+1 > 3
                                                var(nonzeros(-(a-b-c)/2),m) = 0;
                                            end
                                        elseif i < 7
                                            if floor((m-1)/9)+1 > 6 && mod(m-1,9)+1 > 6
                                                var(nonzeros(-(a-b-c)/2),m) = 0;
                                            end
                                        else
                                            if floor((m-1)/9)+1 > 6 && mod(m-1,9)+1 > 6
                                                var(nonzeros(-(a-b-c)/2),m) = 0;
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
count = count + 1;
end
end