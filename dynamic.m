function dzitadt = dynamic(zita, u)
    dzitadt(1) = zita(2);
    dzitadt(2) = u(1);
    dzitadt(3) = zita(4);
    dzitadt(4) = u(2);
end