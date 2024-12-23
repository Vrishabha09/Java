window.onload = function(){
    document.getElementById("download").addEventListener("click", () => {
        const resume = document.getElementById("resume");
        const container = document.createElement('div');

        // Set the container size to match A4 dimensions in pixels
        container.style.width = '794px'; // A4 width in pixels at 96 DPI
        container.style.height = '1500px'; // A4 height in pixels at 96 DPI
        container.style.overflow = 'hidden'; // Ensure content does not overflow

        resume.parentNode.insertBefore(container, resume);
        container.appendChild(resume);

        // Use html2pdf to generate the PDF
        html2pdf().from(container).set({
            margin: [0, 0, 0, 0], // No margins
            filename: 'resume.pdf',
            html2canvas: { scale: 2 }, // Optional: Increase the scale for better quality
            jsPDF: { unit: 'px', format: [794, 1123], orientation: 'portrait' }
        }).toPdf().get('pdf').then(function(pdf) {
            // Perform logout after PDF is downloaded
            window.location.href = "Logout.jsp"; // Replace "logout.jsp" with the URL of your logout page
        }).save();
    });
}
