var msys={
    formatDate: function (longDate) {
        var tempDate = new Date(longDate);
        var formatDate = tempDate.getFullYear() + '-';
        formatDate += tempDate.getMonth() > 8 ? (tempDate.getMonth() + 1) + '-'
            : ('0' + (tempDate.getMonth() + 1)) + '-';
        formatDate += tempDate.getDate() > 9 ? tempDate.getDate()
            : '0' + tempDate.getDate();
        console.log(formatDate);
        return formatDate;
    }
}