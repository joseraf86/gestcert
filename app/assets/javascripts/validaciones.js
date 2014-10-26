function validarNumero( name, min, max) {
              var ff01 = new LiveValidation(name, { validMessage: 'Formato correcto'});
              ff01.add(Validate.Length, {
                  minimum: min, maximum: max,
                  tooLongMessage: 'Máximo 30 dígitos',
              });
              ff01.add(Validate.Format, {
                  pattern: /^\d{1,30}$/i,
                  failureMessage: "Ingrese un valor numérico"
              });
          }
