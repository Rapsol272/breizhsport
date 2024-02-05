//import 'package:breizhsport/Services/ServicesProduct.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Ressources/Cart.dart';
import '../Ressources/Product.dart';
import 'CartPage.dart';
import 'LoginPage.dart';
import 'ProfilPage.dart';

class HomePage extends StatefulWidget {
  //create a list of products sweat shirt and others sport clothes
  /*final List<Product> products = [
    Product(id: 1, name : 'Sweat Shirt', price: 29.99, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque maximus mattis enim et varius. Etiam risus est, fringilla id tortor id, rhoncus hendrerit turpis. Nulla ultrices dui viverra lectus facilisis commodo. Ut placerat, eros ac mollis hendrerit, augue tellus elementum erat, nec vestibulum sem eros in ligula. Fusce laoreet luctus nisl sit amet pellentesque. Integer at diam augue. Quisque mollis sed velit id eleifend. Quisque risus justo, ultrices non commodo nec, blandit quis purus. Mauris molestie mi augue, eget tincidunt velit congue sed. Curabitur cursus in lacus eget feugiat. Praesent vestibulum purus mauris, non consequat sapien faucibus vitae. Sed imperdiet libero nisi, a placerat purus vehicula sit amet. Donec hendrerit placerat dui a tristique. Etiam vitae velit ut massa facilisis fermentum vitae at enim. Nulla vulputate turpis magna, vitae aliquam enim elementum quis. Donec commodo, felis vel iaculis rhoncus, felis eros vulputate ipsum, sed dignissim lectus turpis eu lacus. Ut cursus est quis varius malesuada. Nam non nunc lacus. In hac habitasse platea dictumst. Phasellus augue justo, lacinia eget risus eget, luctus interdum nisl. Fusce mollis ultricies egestas. Duis sollicitudin elementum ipsum. Curabitur egestas ipsum purus, sit amet luctus odio placerat in. Sed sed enim quis nulla lacinia ultricies quis varius orci. Aenean dapibus sodales dolor. Nunc quis interdum lectus, ac rhoncus felis. Aliquam a nisi congue, posuere erat vel, facilisis orci" , image: 'https://imgs.search.brave.com/FqwivKp0Naqcw0ZMVYtheGGa0NcdXm1KGHVhtI6RU-Y/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE0/NjAzNTM1ODE2NDEt/MzdiYWRkYWIwZmEy/P2l4bGliPXJiLTQu/MC4zJml4aWQ9TTN3/eE1qQTNmREI4TUh4/elpXRnlZMmg4TVRC/OGZITm9iMlZ6ZkdW/dWZEQjhmREI4Zkh3/dyZ3PTEwMDAmcT04/MA'),
    Product(id: 2, name : 'Jogging', price: 19.99, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque maximus mattis enim et varius. Etiam risus est, fringilla id tortor id, rhoncus hendrerit turpis. Nulla ultrices dui viverra lectus facilisis commodo. Ut placerat, eros ac mollis hendrerit, augue tellus elementum erat, nec vestibulum sem eros in ligula. Fusce laoreet luctus nisl sit amet pellentesque. Integer at diam augue. Quisque mollis sed velit id eleifend. Quisque risus justo, ultrices non commodo nec, blandit quis purus. Mauris molestie mi augue, eget tincidunt velit congue sed. Curabitur cursus in lacus eget feugiat. Praesent vestibulum purus mauris, non consequat sapien faucibus vitae. Sed imperdiet libero nisi, a placerat purus vehicula sit amet. Donec hendrerit placerat dui a tristique. Etiam vitae velit ut massa facilisis fermentum vitae at enim. Nulla vulputate turpis magna, vitae aliquam enim elementum quis. Donec commodo, felis vel iaculis rhoncus, felis eros vulputate ipsum, sed dignissim lectus turpis eu lacus. Ut cursus est quis varius malesuada. Nam non nunc lacus. In hac habitasse platea dictumst. Phasellus augue justo, lacinia eget risus eget, luctus interdum nisl. Fusce mollis ultricies egestas. Duis sollicitudin elementum ipsum. Curabitur egestas ipsum purus, sit amet luctus odio placerat in. Sed sed enim quis nulla lacinia ultricies quis varius orci. Aenean dapibus sodales dolor. Nunc quis interdum lectus, ac rhoncus felis. Aliquam a nisi congue, posuere erat vel, facilisis orci" , image: 'https://imgs.search.brave.com/FqwivKp0Naqcw0ZMVYtheGGa0NcdXm1KGHVhtI6RU-Y/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE0/NjAzNTM1ODE2NDEt/MzdiYWRkYWIwZmEy/P2l4bGliPXJiLTQu/MC4zJml4aWQ9TTN3/eE1qQTNmREI4TUh4/elpXRnlZMmg4TVRC/OGZITm9iMlZ6ZkdW/dWZEQjhmREI4Zkh3/dyZ3PTEwMDAmcT04/MA'),
    Product(id: 3, name : 'T-Shirt', price: 14.99, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque maximus mattis enim et varius. Etiam risus est, fringilla id tortor id, rhoncus hendrerit turpis. Nulla ultrices dui viverra lectus facilisis commodo. Ut placerat, eros ac mollis hendrerit, augue tellus elementum erat, nec vestibulum sem eros in ligula. Fusce laoreet luctus nisl sit amet pellentesque. Integer at diam augue. Quisque mollis sed velit id eleifend. Quisque risus justo, ultrices non commodo nec, blandit quis purus. Mauris molestie mi augue, eget tincidunt velit congue sed. Curabitur cursus in lacus eget feugiat. Praesent vestibulum purus mauris, non consequat sapien faucibus vitae. Sed imperdiet libero nisi, a placerat purus vehicula sit amet. Donec hendrerit placerat dui a tristique. Etiam vitae velit ut massa facilisis fermentum vitae at enim. Nulla vulputate turpis magna, vitae aliquam enim elementum quis. Donec commodo, felis vel iaculis rhoncus, felis eros vulputate ipsum, sed dignissim lectus turpis eu lacus. Ut cursus est quis varius malesuada. Nam non nunc lacus. In hac habitasse platea dictumst. Phasellus augue justo, lacinia eget risus eget, luctus interdum nisl. Fusce mollis ultricies egestas. Duis sollicitudin elementum ipsum. Curabitur egestas ipsum purus, sit amet luctus odio placerat in. Sed sed enim quis nulla lacinia ultricies quis varius orci. Aenean dapibus sodales dolor. Nunc quis interdum lectus, ac rhoncus felis. Aliquam a nisi congue, posuere erat vel, facilisis orci" , image: 'https://imgs.search.brave.com/FqwivKp0Naqcw0ZMVYtheGGa0NcdXm1KGHVhtI6RU-Y/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE0/NjAzNTM1ODE2NDEt/MzdiYWRkYWIwZmEy/P2l4bGliPXJiLTQu/MC4zJml4aWQ9TTN3/eE1qQTNmREI4TUh4/elpXRnlZMmg4TVRC/OGZITm9iMlZ6ZkdW/dWZEQjhmREI4Zkh3/dyZ3PTEwMDAmcT04/MA'),
    Product(id: 4, name : 'Short', price: 9.99, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque maximus mattis enim et varius. Etiam risus est, fringilla id tortor id, rhoncus hendrerit turpis. Nulla ultrices dui viverra lectus facilisis commodo. Ut placerat, eros ac mollis hendrerit, augue tellus elementum erat, nec vestibulum sem eros in ligula. Fusce laoreet luctus nisl sit amet pellentesque. Integer at diam augue. Quisque mollis sed velit id eleifend. Quisque risus justo, ultrices non commodo nec, blandit quis purus. Mauris molestie mi augue, eget tincidunt velit congue sed. Curabitur cursus in lacus eget feugiat. Praesent vestibulum purus mauris, non consequat sapien faucibus vitae. Sed imperdiet libero nisi, a placerat purus vehicula sit amet. Donec hendrerit placerat dui a tristique. Etiam vitae velit ut massa facilisis fermentum vitae at enim. Nulla vulputate turpis magna, vitae aliquam enim elementum quis. Donec commodo, felis vel iaculis rhoncus, felis eros vulputate ipsum, sed dignissim lectus turpis eu lacus. Ut cursus est quis varius malesuada. Nam non nunc lacus. In hac habitasse platea dictumst. Phasellus augue justo, lacinia eget risus eget, luctus interdum nisl. Fusce mollis ultricies egestas. Duis sollicitudin elementum ipsum. Curabitur egestas ipsum purus, sit amet luctus odio placerat in. Sed sed enim quis nulla lacinia ultricies quis varius orci. Aenean dapibus sodales dolor. Nunc quis interdum lectus, ac rhoncus felis. Aliquam a nisi congue, posuere erat vel, facilisis orci." , image: 'https://imgs.search.brave.com/FqwivKp0Naqcw0ZMVYtheGGa0NcdXm1KGHVhtI6RU-Y/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE0/NjAzNTM1ODE2NDEt/MzdiYWRkYWIwZmEy/P2l4bGliPXJiLTQu/MC4zJml4aWQ9TTN3/eE1qQTNmREI4TUh4/elpXRnlZMmg4TVRC/OGZITm9iMlZ6ZkdW/dWZEQjhmREI4Zkh3/dyZ3PTEwMDAmcT04/MA'),
    Product(id: 5, name : 'Casquette', price: 4.99, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque maximus mattis enim et varius. Etiam risus est, fringilla id tortor id, rhoncus hendrerit turpis. Nulla ultrices dui viverra lectus facilisis commodo. Ut placerat, eros ac mollis hendrerit, augue tellus elementum erat, nec vestibulum sem eros in ligula. Fusce laoreet luctus nisl sit amet pellentesque. Integer at diam augue. Quisque mollis sed velit id eleifend. Quisque risus justo, ultrices non commodo nec, blandit quis purus. Mauris molestie mi augue, eget tincidunt velit congue sed. Curabitur cursus in lacus eget feugiat. Praesent vestibulum purus mauris, non consequat sapien faucibus vitae. Sed imperdiet libero nisi, a placerat purus vehicula sit amet. Donec hendrerit placerat dui a tristique. Etiam vitae velit ut massa facilisis fermentum vitae at enim. Nulla vulputate turpis magna, vitae aliquam enim elementum quis. Donec commodo, felis vel iaculis rhoncus, felis eros vulputate ipsum, sed dignissim lectus turpis eu lacus. Ut cursus est quis varius malesuada. Nam non nunc lacus. In hac habitasse platea dictumst. Phasellus augue justo, lacinia eget risus eget, luctus interdum nisl. Fusce mollis ultricies egestas. Duis sollicitudin elementum ipsum. Curabitur egestas ipsum purus, sit amet luctus odio placerat in. Sed sed enim quis nulla lacinia ultricies quis varius orci. Aenean dapibus sodales dolor. Nunc quis interdum lectus, ac rhoncus felis. Aliquam a nisi congue, posuere erat vel, facilisis orci." , image: 'https://imgs.search.brave.com/FqwivKp0Naqcw0ZMVYtheGGa0NcdXm1KGHVhtI6RU-Y/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE0/NjAzNTM1ODE2NDEt/MzdiYWRkYWIwZmEy/P2l4bGliPXJiLTQu/MC4zJml4aWQ9TTN3/eE1qQTNmREI4TUh4/elpXRnlZMmg4TVRC/OGZITm9iMlZ6ZkdW/dWZEQjhmREI4Zkh3/dyZ3PTEwMDAmcT04/MA'),
    Product(id: 6, name : 'Chaussettes', price: 2.99, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque maximus mattis enim et varius. Etiam risus est, fringilla id tortor id, rhoncus hendrerit turpis. Nulla ultrices dui viverra lectus facilisis commodo. Ut placerat, eros ac mollis hendrerit, augue tellus elementum erat, nec vestibulum sem eros in ligula. Fusce laoreet luctus nisl sit amet pellentesque. Integer at diam augue. Quisque mollis sed velit id eleifend. Quisque risus justo, ultrices non commodo nec, blandit quis purus. Mauris molestie mi augue, eget tincidunt velit congue sed. Curabitur cursus in lacus eget feugiat. Praesent vestibulum purus mauris, non consequat sapien faucibus vitae. Sed imperdiet libero nisi, a placerat purus vehicula sit amet. Donec hendrerit placerat dui a tristique. Etiam vitae velit ut massa facilisis fermentum vitae at enim. Nulla vulputate turpis magna, vitae aliquam enim elementum quis. Donec commodo, felis vel iaculis rhoncus, felis eros vulputate ipsum, sed dignissim lectus turpis eu lacus. Ut cursus est quis varius malesuada. Nam non nunc lacus. In hac habitasse platea dictumst. Phasellus augue justo, lacinia eget risus eget, luctus interdum nisl. Fusce mollis ultricies egestas. Duis sollicitudin elementum ipsum. Curabitur egestas ipsum purus, sit amet luctus odio placerat in. Sed sed enim quis nulla lacinia ultricies quis varius orci. Aenean dapibus sodales dolor. Nunc quis interdum lectus, ac rhoncus felis. Aliquam a nisi congue, posuere erat vel, facilisis orci." , image: 'https://imgs.search.brave.com/FqwivKp0Naqcw0ZMVYtheGGa0NcdXm1KGHVhtI6RU-Y/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE0/NjAzNTM1ODE2NDEt/MzdiYWRkYWIwZmEy/P2l4bGliPXJiLTQu/MC4zJml4aWQ9TTN3/eE1qQTNmREI4TUh4/elpXRnlZMmg4TVRC/OGZITm9iMlZ6ZkdW/dWZEQjhmREI4Zkh3/dyZ3PTEwMDAmcT04/MA'),
    Product(id: 7, name : 'Sac', price: 24.99, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque maximus mattis enim et varius. Etiam risus est, fringilla id tortor id, rhoncus hendrerit turpis. Nulla ultrices dui viverra lectus facilisis commodo. Ut placerat, eros ac mollis hendrerit, augue tellus elementum erat, nec vestibulum sem eros in ligula. Fusce laoreet luctus nisl sit amet pellentesque. Integer at diam augue. Quisque mollis sed velit id eleifend. Quisque risus justo, ultrices non commodo nec, blandit quis purus. Mauris molestie mi augue, eget tincidunt velit congue sed. Curabitur cursus in lacus eget feugiat. Praesent vestibulum purus mauris, non consequat sapien faucibus vitae. Sed imperdiet libero nisi, a placerat purus vehicula sit amet. Donec hendrerit placerat dui a tristique. Etiam vitae velit ut massa facilisis fermentum vitae at enim. Nulla vulputate turpis magna, vitae aliquam enim elementum quis. Donec commodo, felis vel iaculis rhoncus, felis eros vulputate ipsum, sed dignissim lectus turpis eu lacus. Ut cursus est quis varius malesuada. Nam non nunc lacus. In hac habitasse platea dictumst. Phasellus augue justo, lacinia eget risus eget, luctus interdum nisl. Fusce mollis ultricies egestas. Duis sollicitudin elementum ipsum. Curabitur egestas ipsum purus, sit amet luctus odio placerat in. Sed sed enim quis nulla lacinia ultricies quis varius orci. Aenean dapibus sodales dolor. Nunc quis interdum lectus, ac rhoncus felis. Aliquam a nisi congue, posuere erat vel, facilisis orci." , image: 'https://imgs.search.brave.com/FqwivKp0Naqcw0ZMVYtheGGa0NcdXm1KGHVhtI6RU-Y/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE0/NjAzNTM1ODE2NDEt/MzdiYWRkYWIwZmEy/P2l4bGliPXJiLTQu/MC4zJml4aWQ9TTN3/eE1qQTNmREI4TUh4/elpXRnlZMmg4TVRC/OGZITm9iMlZ6ZkdW/dWZEQjhmREI4Zkh3/dyZ3PTEwMDAmcT04/MA'),
    Product(id: 8, name : 'Bouteille', price: 4.99, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque maximus mattis enim et varius. Etiam risus est, fringilla id tortor id, rhoncus hendrerit turpis. Nulla ultrices dui viverra lectus facilisis commodo. Ut placerat, eros ac mollis hendrerit, augue tellus elementum erat, nec vestibulum sem eros in ligula. Fusce laoreet luctus nisl sit amet pellentesque. Integer at diam augue. Quisque mollis sed velit id eleifend. Quisque risus justo, ultrices non commodo nec, blandit quis purus. Mauris molestie mi augue, eget tincidunt velit congue sed. Curabitur cursus in lacus eget feugiat. Praesent vestibulum purus mauris, non consequat sapien faucibus vitae. Sed imperdiet libero nisi, a placerat purus vehicula sit amet. Donec hendrerit placerat dui a tristique. Etiam vitae velit ut massa facilisis fermentum vitae at enim. Nulla vulputate turpis magna, vitae aliquam enim elementum quis. Donec commodo, felis vel iaculis rhoncus, felis eros vulputate ipsum, sed dignissim lectus turpis eu lacus. Ut cursus est quis varius malesuada. Nam non nunc lacus. In hac habitasse platea dictumst. Phasellus augue justo, lacinia eget risus eget, luctus interdum nisl. Fusce mollis ultricies egestas. Duis sollicitudin elementum ipsum. Curabitur egestas ipsum purus, sit amet luctus odio placerat in. Sed sed enim quis nulla lacinia ultricies quis varius orci. Aenean dapibus sodales dolor. Nunc quis interdum lectus, ac rhoncus felis. Aliquam a nisi congue, posuere erat vel, facilisis orci." , image: 'https://imgs.search.brave.com/FqwivKp0Naqcw0ZMVYtheGGa0NcdXm1KGHVhtI6RU-Y/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE0/NjAzNTM1ODE2NDEt/MzdiYWRkYWIwZmEy/P2l4bGliPXJiLTQu/MC4zJml4aWQ9TTN3/eE1qQTNmREI4TUh4/elpXRnlZMmg4TVRC/OGZITm9iMlZ6ZkdW/dWZEQjhmREI4Zkh3/dyZ3PTEwMDAmcT04/MA'),
    Product(id: 9, name : 'Gants', price: 4.99, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque maximus mattis enim et varius. Etiam risus est, fringilla id tortor id, rhoncus hendrerit turpis. Nulla ultrices dui viverra lectus facilisis commodo. Ut placerat, eros ac mollis hendrerit, augue tellus elementum erat, nec vestibulum sem eros in ligula. Fusce laoreet luctus nisl sit amet pellentesque. Integer at diam augue. Quisque mollis sed velit id eleifend. Quisque risus justo, ultrices non commodo nec, blandit quis purus. Mauris molestie mi augue, eget tincidunt velit congue sed. Curabitur cursus in lacus eget feugiat. Praesent vestibulum purus mauris, non consequat sapien faucibus vitae. Sed imperdiet libero nisi, a placerat purus vehicula sit amet. Donec hendrerit placerat dui a tristique. Etiam vitae velit ut massa facilisis fermentum vitae at enim. Nulla vulputate turpis magna, vitae aliquam enim elementum quis. Donec commodo, felis vel iaculis rhoncus, felis eros vulputate ipsum, sed dignissim lectus turpis eu lacus. Ut cursus est quis varius malesuada. Nam non nunc lacus. In hac habitasse platea dictumst. Phasellus augue justo, lacinia eget risus eget, luctus interdum nisl. Fusce mollis ultricies egestas. Duis sollicitudin elementum ipsum. Curabitur egestas ipsum purus, sit amet luctus odio placerat in. Sed sed enim quis nulla lacinia ultricies quis varius orci. Aenean dapibus sodales dolor. Nunc quis interdum lectus, ac rhoncus felis. Aliquam a nisi congue, posuere erat vel, facilisis orci." , image: 'https://imgs.search.brave.com/FqwivKp0Naqcw0ZMVYtheGGa0NcdXm1KGHVhtI6RU-Y/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE0/NjAzNTM1ODE2NDEt/MzdiYWRkYWIwZmEy/P2l4bGliPXJiLTQu/MC4zJml4aWQ9TTN3/eE1qQTNmREI4TUh4/elpXRnlZMmg4TVRC/OGZITm9iMlZ6ZkdW/dWZEQjhmREI4Zkh3/dyZ3PTEwMDAmcT04/MA'),
    Product(id: 10, name : 'Ballon', price: 9.99, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque maximus mattis enim et varius. Etiam risus est, fringilla id tortor id, rhoncus hendrerit turpis. Nulla ultrices dui viverra lectus facilisis commodo. Ut placerat, eros ac mollis hendrerit, augue tellus elementum erat, nec vestibulum sem eros in ligula. Fusce laoreet luctus nisl sit amet pellentesque. Integer at diam augue. Quisque mollis sed velit id eleifend. Quisque risus justo, ultrices non commodo nec, blandit quis purus. Mauris molestie mi augue, eget tincidunt velit congue sed. Curabitur cursus in lacus eget feugiat. Praesent vestibulum purus mauris, non consequat sapien faucibus vitae. Sed imperdiet libero nisi, a placerat purus vehicula sit amet. Donec hendrerit placerat dui a tristique. Etiam vitae velit ut massa facilisis fermentum vitae at enim. Nulla vulputate turpis magna, vitae aliquam enim elementum quis. Donec commodo, felis vel iaculis rhoncus, felis eros vulputate ipsum, sed dignissim lectus turpis eu lacus. Ut cursus est quis varius malesuada. Nam non nunc lacus. In hac habitasse platea dictumst. Phasellus augue justo, lacinia eget risus eget, luctus interdum nisl. Fusce mollis ultricies egestas. Duis sollicitudin elementum ipsum. Curabitur egestas ipsum purus, sit amet luctus odio placerat in. Sed sed enim quis nulla lacinia ultricies quis varius orci. Aenean dapibus sodales dolor. Nunc quis interdum lectus, ac rhoncus felis. Aliquam a nisi congue, posuere erat vel, facilisis orci." , image: 'https://imgs.search.brave.com/FqwivKp0Naqcw0ZMVYtheGGa0NcdXm1KGHVhtI6RU-Y/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE0/NjAzNTM1ODE2NDEt/MzdiYWRkYWIwZmEy/P2l4bGliPXJiLTQu/MC4zJml4aWQ9TTN3/eE1qQTNmREI4TUh4/elpXRnlZMmg4TVRC/OGZITm9iMlZ6ZkdW/dWZEQjhmREI4Zkh3/dyZ3PTEwMDAmcT04/MA'),
    Product(id: 11, name : 'Chaussures', price: 29.99, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque maximus mattis enim et varius. Etiam risus est, fringilla id tortor id, rhoncus hendrerit turpis. Nulla ultrices dui viverra lectus facilisis commodo. Ut placerat, eros ac mollis hendrerit, augue tellus elementum erat, nec vestibulum sem eros in ligula. Fusce laoreet luctus nisl sit amet pellentesque. Integer at diam augue. Quisque mollis sed velit id eleifend. Quisque risus justo, ultrices non commodo nec, blandit quis purus. Mauris molestie mi augue, eget tincidunt velit congue sed. Curabitur cursus in lacus eget feugiat. Praesent vestibulum purus mauris, non consequat sapien faucibus vitae. Sed imperdiet libero nisi, a placerat purus vehicula sit amet. Donec hendrerit placerat dui a tristique. Etiam vitae velit ut massa facilisis fermentum vitae at enim. Nulla vulputate turpis magna, vitae aliquam enim elementum quis. Donec commodo, felis vel iaculis rhoncus, felis eros vulputate ipsum, sed dignissim lectus turpis eu lacus. Ut cursus est quis varius malesuada. Nam non nunc lacus. In hac habitasse platea dictumst. Phasellus augue justo, lacinia eget risus eget, luctus interdum nisl. Fusce mollis ultricies egestas. Duis sollicitudin elementum ipsum. Curabitur egestas ipsum purus, sit amet luctus odio placerat in. Sed sed enim quis nulla lacinia ultricies quis varius orci. Aenean dapibus sodales dolor. Nunc quis interdum lectus, ac rhoncus felis. Aliquam a nisi congue, posuere erat vel, facilisis orci." , image: 'https://www.breizhsport.com/wp-content/uploads/2020/10/logo-breizh-sport.png'), 
     
  ];*/

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Cart _cart = Cart();
  String _searchQuery = '';
  User? _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((user) {
      setState(() {
        _user = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Image(
          image: AssetImage('images/logo.png'),
          height: 48,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              if (_user == null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartPage(cart: _cart)),
                );
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.people),
            onPressed: () {
              if (_user == null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilPage()),
                );
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              if (_user != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all((MediaQuery.of(context).size.width / 200) * 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //search bar
            TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Rechercher un produit',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        _searchQuery = '';
                      });
                    },
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                }),
            Title(
                color: Colors.black,
                child: Text(
                  'Produits',
                  style: TextStyle(
                      fontSize:
                          ((MediaQuery.of(context).size.width + 1000) / 400)
                                  .floor() *
                              8,
                      fontWeight: FontWeight.bold),
                )),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final List<DocumentSnapshot> documents = snapshot.data!.docs;
                  final int crossAxisCount =
                      ((MediaQuery.of(context).size.width / 300).floor() == 0
                          ? 1
                          : (MediaQuery.of(context).size.width / 300).floor());
                  final double crossAxisSpacing =
                      (MediaQuery.of(context).size.width / 200) * 4;
                  final double mainAxisSpacing =
                      (MediaQuery.of(context).size.width / 200) * 4;
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: crossAxisSpacing,
                        mainAxisSpacing: mainAxisSpacing,
                        childAspectRatio: 1,
                      ),
                      itemCount: documents.length,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) {
                        final Product product =
                            Product.fromSnapshot(documents[index]);

                        if (_searchQuery.isEmpty ||
                            product.name
                                .toUpperCase()
                                .contains(_searchQuery.toUpperCase())) {
                          return ProductWidget(
                            product: product,
                            cart: _cart,
                            onAddToCart: () {
                              _cart.addItem(product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Added to cart')),
                              );
                            },
                          );
                        } else {
                          return Container();
                        }
                      });
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: const Color(0xFFD84727),
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '© 2023 BreizhSport',
                style: TextStyle(
                    fontSize: ((MediaQuery.of(context).size.width + 1000) / 400)
                            .floor() *
                        3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
