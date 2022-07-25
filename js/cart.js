function add() {
  var div = document.getElementById("newpost");
  div.classList.toggle('hidden'); 

        var s1i1=parseInt(document.getElementById("S1I1").value);
        var s1i2=parseInt(document.getElementById("S1I2").value);
        var s1i3=parseInt(document.getElementById("S1I3").value);
        var s1i4=parseInt(document.getElementById("S1I4").value);


        var s2i1=parseInt(document.getElementById("S2I1").value);
        var s2i2=parseInt(document.getElementById("S2I2").value);
        var s2i3=parseInt(document.getElementById("S2I3").value);
        var s2i4=parseInt(document.getElementById("S2I4").value);
 
        var s3i1=parseInt(document.getElementById("S3I1").value);
        var s3i2=parseInt(document.getElementById("S3I2").value);
        var s3i3=parseInt(document.getElementById("S3I3").value);
        var s3i4=parseInt(document.getElementById("S3I4").value);

        var item1=75*s1i1;
        var item2=59*s1i2;
        var item3=79*s1i3;
        var item4=65*s1i4;
        
        var item5=85*s2i1;
        var item6=69*s2i2;
        var item7=89*s2i3;
        var item8=75*s2i4;

        var item9=45*s3i1;
        var item10=39*s3i2;
        var item11=19*s3i3;
        var item12=25*s3i4;

        var sum = item1+item2+item3+item4+item5+item6+item7+item8+item9+item10+item11+item12;
        document.getElementById("res").value=sum;
}

    function details(){
    var amount=document.getElementById("res").value;
    var name=document.getElementById("name").value;
    var address=document.getElementById("address").value;
    var contract=document.getElementById("contact").value;
}