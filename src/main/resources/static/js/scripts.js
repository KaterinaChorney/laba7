function confirmDelete(entityId, hiddenInputId) {
    document.getElementById(hiddenInputId).value = entityId;
    document.getElementById("deleteModal").style.display = "block";
}

function hideModal() {
    document.getElementById("deleteModal").style.display = "none";
}

window.onclick = function(event) {
    if (event.target.classList.contains('modal')) {
        const visibleModals = document.querySelectorAll('.modal[style="display: block;"]');
        visibleModals.forEach(modal => {
            modal.style.display = 'none';
        });
    }
};