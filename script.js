const projects = [
    {
        title: "Terraform Infrastructure Refactor",
        link: "https://www.notion.so/Terraform-Infrastucture-Refactor-3acdccacd00541beba9d356031c20dcb?pvs=21",
        description: "Optimisation et refactorisation d'infrastructure cloud via Terraform, garantissant une meilleure scalabilité, sécurité et maintenabilité."
    },
    {
        title: "DataSync Documentation",
        link: "https://www.notion.so/DataSync-Documentation-2e8e6fd3895d4bf4a2135933e773b1a6?pvs=21",
        description: "Script de synchronisation de bases de données avec anonymisation des données sensibles pour un environnement de test proche de la production.",
        technicalDetails: "Connexion SSO via AWS, exécution dans un workflow GitHub Actions. Tunnel sécurisé pour la connexion à une base de données via un serveur de rebond. Dump, restauration, et anonymisation de données."
    },
    {
        title: "RDS Access Validator (AWS Tunnel v2)",
        link: "https://www.notion.so/RDS-access-validator-aws-tunnel-v2-cf77da9b297e456dbd691b864b010d65?pvs=21",
        description: "Script de gestion des accès à une base de données, utilisant des ressources AWS pour un contrôle précis et sécurisé des flux de connexion.",
        technicalDetails: "Utilisation de SSO, tunnel SSH, documents SSM, Lambdas pour les notifications, intégration Slack pour la gestion des approbations."
    },
    {
        title: "AWS Cloud ArchType",
        link: "https://www.notion.so/AWS-Cloud-ArchType-882e0edd46b44617987cfe0049f2c9ea?pvs=21",
        description: "Travail sur de nouvelles architectures Cloud pour une optimisation des ressources et des coûts.",
        technicalDetails: "Automatisation des backups de base de données via State Manager, création d'AMIs et configuration d'un CRON pour des backups réguliers."
    }
];

document.addEventListener("DOMContentLoaded", function() {
    const projectContainer = document.getElementById('projects');

    if (projectContainer) {
        projects.forEach(project => {
            const projectElement = document.createElement('div');
            projectElement.className = 'project';

            const titleElement = document.createElement('h3');
            const linkElement = document.createElement('a');
            linkElement.href = project.link;
            linkElement.textContent = project.title;
            linkElement.target = '_blank';
            titleElement.appendChild(linkElement);

            const descriptionElement = document.createElement('p');
            descriptionElement.textContent = project.description;

            projectElement.appendChild(titleElement);
            projectElement.appendChild(descriptionElement);

            if (project.technicalDetails) {
                const detailsElement = document.createElement('p');
                detailsElement.textContent = `Détails techniques : ${project.technicalDetails}`;
                projectElement.appendChild(detailsElement);
            }

            projectContainer.appendChild(projectElement);
        });
    } else {
        console.error("L'élément avec l'ID 'projects' n'a pas été trouvé.");
    }
});



