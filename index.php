<?php
session_start();
if (!isset($_SESSION['utilisateur']) || $_SESSION['utilisateur']['type'] !== 'admin') {
    header("Location: login.html");
    exit();
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Espace Administrateur</title>
    <link rel="stylesheet" href="index.css"/>
</head>
<body>
<header>
    <h1>Espace Administrateur</h1>
    <nav>
        <a href="#">Inscrire un étudiant</a>
        <a href="#">Ajouter une formation & matières de la formation</a>
        <a href="#">Ajouter les notes des etudiants</a>
        <a href="#">Voir l'ensemble des étudiants inscrits</a>
        <a href="#">voir note d'un etudiant</a>
        <a href="#">modifier les informations d'un etudiant</a>
        <a href="#">modifier les notes des etudiants</a>
        <a href="logout.php">Déconnexion</a>
    </nav>
</header>
<main>
    <section>
        <h2>Bienvenue, <?php echo $_SESSION['utilisateur']['login']; ?></h2>
        <p>Gestion des étudiants et des notes.</p>
    </section>
</main>
</body>
</html>