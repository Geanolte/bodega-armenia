# Reabastecimiento Bodega Armenia

App web instalable (PWA) para el coordinador de la bodega de Armenia: indica qué traer de la bodega externa (07X1E) a la general (07001) por agotados, qué llevar a la externa por baja rotación, y arma un plan de traslado con peso objetivo y ajustes manuales.

- Este repositorio **solo contiene el código de la app**. No contiene datos de SIESA.
- Los datos (solo cantidades, sin costos ni valores) se cargan desde la propia app y se guardan en Supabase (`bodega_kv`) y en el navegador de cada usuario.
- `supabase_setup.sql` crea la tabla en Supabase.

Uso interno de Dislicores.
