import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App',
      initialRoute: '/',
      routes: {
        '/': (context) => Inicio(),
        '/inicio-sesion': (context) => InicioSesion(),
        '/registro': (context) => Registro(),
        '/tienda': (context) => Tienda(),
        '/buscar-producto': (context) => BuscarProducto(),
        '/tarjeta-pago': (context) => TarjetaPago(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tienda de Ferretería"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              "¡Bienvenido a nuestra tienda!",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Ahora podrás encontrar de todo para tu construcción en la comodidad de tu celular",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 20),
                            Image.asset(
                              'assets/logo1.png',
                              width: 200,
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/inicio-sesion'),
                              style: ElevatedButton.styleFrom(
                                primary:
                                    Color.fromARGB(255, 230, 189, 56), // Cambia el color de fondo del botón
                                onPrimary:
                                    Colors.blue, // Cambia el color de texto del botón
                              ),
                              child: Text('Iniciar Sesión'),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/registro'),
                              style: ElevatedButton.styleFrom(
                                primary:
                                    Color.fromARGB(255, 230, 189, 56), // Cambia el color de fondo del botón
                                onPrimary:
                                    Colors.blue, // Cambia el color de texto del botón
                              ),
                              child: Text('Registrarse'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InicioSesion extends StatelessWidget {
  const InicioSesion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Iniciar Sesión"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Iniciar Sesión",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Correo Electrónico',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Contraseña',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón de iniciar sesión
                Navigator.pushNamed(context, '/tienda');
              },
              child: Text('Iniciar Sesión'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Acción al presionar el botón de recuperar contraseña
              },
              child: Text('¿Olvidaste tu contraseña?'),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("¿No tienes una cuenta?"),
                TextButton(
                  onPressed: () {
                    // Acción al presionar el botón de registrarse
                    Navigator.pushNamed(context, '/registro');
                  },
                  child: Text('Regístrate'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Registro extends StatelessWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrarse"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Formulario de registro",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nombre',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Correo Electrónico',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Contraseña',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Confirmar Contraseña',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón de registrarse
              },
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}
class Tienda extends StatefulWidget {
  const Tienda({Key? key}) : super(key: key);

  @override
  _TiendaState createState() => _TiendaState();
}

class _TiendaState extends State<Tienda> {
  int currentIndex = 0;

  List<Producto> productos = [
    Producto(
      nombre: 'Martillo',
      precio: 30.00,
      imagen: 'assets/martillo.png',
    ),
    Producto(
      nombre: 'Cerrucho',
      precio: 45.00,
      imagen: 'assets/cerrucho.png',
    ),
    Producto(
      nombre: 'Cemento',
      precio: 5.99,
      imagen: 'assets/cemento.png',
    ),
    Producto(
      nombre: 'Lampa',
      precio: 45.00,
      imagen: 'assets/lampa.png',
    ),
    Producto(
      nombre: 'Lentes Negros',
      precio: 18.00,
      imagen: 'assets/lentes-negros.png',
    ),
    Producto(
      nombre: 'Lentes Transparentes',
      precio: 20.00,
      imagen: 'assets/lentes-blancos.png',
    ),
    // Agrega más productos aquí según tus necesidades
  ];

  List<Producto> carrito = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tienda"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Bienvenido a la tienda",
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: productos.map((producto) {
                return GestureDetector(
                  onTap: () {
                    agregarAlCarrito(producto);
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          producto.imagen,
                          width: 100,
                          height: 100,
                        ),
                        Text(producto.nombre),
                        Text('\$${producto.precio.toStringAsFixed(2)}'),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.transparent, // Establecer el color de fondo como transparente
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/tarjeta-pago');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/buscar-producto');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/carrito', arguments: carrito);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Tarjeta de Pago',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar Producto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrito',
          ),
        ],
      ),
    );
  }

  void agregarAlCarrito(Producto producto) {
    setState(() {
      carrito.add(producto);
    });
  }
}

class Producto {
  final String nombre;
  final double precio;
  final String imagen;

  Producto({
    required this.nombre,
    required this.precio,
    required this.imagen,
  });
}

class BuscarProducto extends StatelessWidget {
  const BuscarProducto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buscar Producto"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Buscar Producto",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nombre del producto',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text('Buscar'),
            ),
          ],
        ),
      ),
    );
  }
}

class TarjetaPago extends StatelessWidget {
  const TarjetaPago({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarjeta de Pago"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Tarjeta de Pago",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nombre en la tarjeta',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Número de tarjeta',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text('Realizar Pago'),
            ),
          ],
        ),
      ),
    );
  }
}